//
//  SDLoginInfo.h
//  ShuiDongGou
//
//  Created by q on 2017/10/20.
//  Copyright © 2017年 付新明. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SDLoginInfo : NSObject
//登录信息转换成对象
+ (SDLoginInfo *)loginInfoWithDict:(NSDictionary *)dInfo;
@property (nonatomic, copy) NSString *tkn;//Token，需要登录认证的接口都需要传token
+ (BOOL)isLogin;
@end
