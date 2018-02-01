//
//  NSObject+Http.h
//  ShuiDongGou
//
//  Created by q on 2017/10/20.
//  Copyright © 2017年 付新明. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (Http)
@property (nonatomic, copy) id userInfo;
+ (void)getDataWithUrl:(NSString *)url success:(void (^)(id json))success fail:(void (^)(id json))fail;
+ (void)postDataWithHost:(NSString *)host Path:(NSString *)path Param:(NSDictionary *)param isCache:(BOOL)isCache success:(void (^)(id json))success fail:(void (^)(id json))fail;
+ (void)getDataWithHost:(NSString *)host Path:(NSString *)path Param:(NSDictionary *)param isCache:(BOOL)isCache success:(void (^)(id json))success fail:(void (^)(id json))fail;
+ (void)uploadPic:(NSString *)host path:(NSString *)path param:(NSDictionary *)param files:(NSArray *)files success:(void (^)(id json))success fail:(void (^)(id json))fail;
@end
