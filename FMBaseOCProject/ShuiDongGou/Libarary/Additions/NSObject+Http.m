//
//  NSObject+Http.m
//  ShuiDongGou
//
//  Created by q on 2017/10/20.
//  Copyright © 2017年 付新明. All rights reserved.
//

#import "NSObject+Http.h"
#import <objc/runtime.h>
#import "AFNetworking.h"
static const void *tagKey = &tagKey;
@implementation NSObject (Http)
- (void)setUserInfo:(id)info {
    objc_setAssociatedObject(self, tagKey, info, OBJC_ASSOCIATION_COPY_NONATOMIC);
}
-(NSString *)userInfo {
    return objc_getAssociatedObject(self, tagKey);
}

+ (void)getDataWithUrl:(NSString *)url success:(void (^)(id json))success fail:(void (^)(id json))fail
{
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    [manager.requestSerializer setTimeoutInterval:30];
    [manager.requestSerializer setCachePolicy:NSURLRequestReloadIgnoringLocalCacheData];
    [manager GET:url parameters:nil progress:^(NSProgress * downloadProgress) {
    } success:^(NSURLSessionDataTask * task, id  responseObject) {
        FMBlock(success,responseObject);
    } failure:^(NSURLSessionDataTask * task, NSError *   error) {
        FMBlock(fail,nil);
    }];
}

+ (void)getDataWithHost:(NSString *)host Path:(NSString *)path Param:(NSDictionary *)param isCache:(BOOL)isCache success:(void (^)(id json))success fail:(void (^)(id json))fail
{
    AFURLSessionManager *manager = [[AFURLSessionManager alloc] initWithSessionConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
    
    NSMutableURLRequest *request = [[AFHTTPRequestSerializer serializer] requestWithMethod:@"GET" URLString:[NSString stringWithFormat:@"%@%@",host,path] parameters:param error:nil];
    request.timeoutInterval= 30;
    [request setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
//    [request setHTTPBody:[param dataUsingEncoding:NSUTF8StringEncoding]];
    
    AFJSONResponseSerializer *responseSerializer = [AFJSONResponseSerializer serializer];
    responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/html", @"text/json", @"text/javascript", @"text/plain", nil];
    manager.responseSerializer = responseSerializer;
    
    [[manager dataTaskWithRequest:request completionHandler:^(NSURLResponse * _Nonnull response, id  _Nullable responseObject, NSError * _Nullable error) {
        if (!error) {
            FMBlock(success,responseObject);
        } else {
            FMBlock(fail,error);
        }
    }] resume];
}

+ (void)postDataWithHost:(NSString *)host Path:(NSString *)path Param:(NSDictionary *)param isCache:(BOOL)isCache success:(void (^)(id json))success fail:(void (^)(id json))fail
{
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    [manager.requestSerializer setTimeoutInterval:30];
    [manager POST:[NSString stringWithFormat:@"%@%@",host,path] parameters:param constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
        
    } progress:^(NSProgress * _Nonnull uploadProgress) {
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if (success) {
            success(responseObject);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (fail) {
            fail(nil);
        }
    }];
}

+ (void)uploadPic:(NSString *)host path:(NSString *)path param:(NSDictionary *)param files:(NSArray *)files success:(void (^)(id json))success fail:(void (^)(id json))fail
{
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    if (files==nil||[files count]==0) {
        [manager.requestSerializer setTimeoutInterval:30];
    }
    else{
        [manager.requestSerializer setTimeoutInterval:120];
    }
    [manager POST:[NSString stringWithFormat:@"%@%@",host,path] parameters:param constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
        if (files&&files.count>0) {
            for (int k = 0; k < [files count]; k++) {
                NSDictionary *dic = [files objectAtIndex:k];
                NSString *key = [[dic allKeys] objectAtIndex:0];
                NSData *fileData = [NSData dataWithContentsOfFile:StrRelay(dic[key])];
                NSString *fileName = StrRelay(dic[key]);
                fileName = [fileName lastPathComponent];
                if (fileData) {
                    [formData appendPartWithFileData:fileData name:key fileName:StrRelay(fileName) mimeType:@"*/*"];
                }
            }
        }
        
    } progress:^(NSProgress * _Nonnull uploadProgress) {
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if (success) {
            success(responseObject);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (fail) {
            fail(nil);
        }
    }];
}
@end
