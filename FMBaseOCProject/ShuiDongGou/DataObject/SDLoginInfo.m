//
//  SDLoginInfo.m
//  ShuiDongGou
//
//  Created by q on 2017/10/20.
//  Copyright © 2017年 付新明. All rights reserved.
//

#import "SDLoginInfo.h"
#import "AppDelegate.h"
@implementation SDLoginInfo
+ (SDLoginInfo *)loginInfoWithDict:(NSDictionary *)dInfo{
    SDLoginInfo *loginInfo = [[SDLoginInfo alloc] init];
    loginInfo.tkn = StrRelay(dInfo[@""]);
    return loginInfo;
}

+ (BOOL)isLogin {
    AppDelegate *del = [[UIApplication sharedApplication] delegate];

    //    NSString *str = [FMUtil getAppVersion];
    //    if (![[FMUtil strRelay:[FMUtil appDelegate].loginInfo.appVersion] isEqualToString:str]) {
    //        return NO;
    //    }
    return YES;
    return YES;
}
@end
