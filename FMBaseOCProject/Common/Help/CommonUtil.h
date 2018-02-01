//
//  CommonUtil.h
//  FMBaseOCProject
//
//  Created by q on 2017/10/20.
//  Copyright © 2017年 付新明. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface CommonUtil : NSObject
+ (BOOL)strNilOrEmpty:(NSString *)str;
+ (NSString *)strRelay:(id)str;

+ (CGSize)sizeForFont:(NSString *)str Font:(UIFont *)font CtrlSize:(CGSize)size;
+ (CGFloat)heightForFont:(NSString *)str Font:(UIFont *)font CtrlSize:(CGSize)size;

+ (NSString *)strGUID;

+ (void)checkTextField:(UITextField *)textField maxLen:(int)max;
@end
