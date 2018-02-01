//
//  WJAppUtil.h
//  阳光好车 SunnyCar
//
//  Created by jienliang on 2017/6/15.
//  Copyright © 2017年 jienliang. All rights reserved.
//
#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

#import "PXAlertView.h"
#import "PXAlertView+Customization.h"

@interface WJAppUtil : NSObject
+ (NSMutableDictionary *)getPublicParam;

+ (UILabel *)createLabWithText:(NSString *)t font:(UIFont *)f textColor:(UIColor *)cc textAliment:(NSTextAlignment)alinement maxWidth:(float)maxW;
+ (UIButton *)createBtnWithText:(NSString *)t font:(UIFont *)f textColor:(UIColor *)color;


+ (void)showAlertWithTitle:(NSString *)title andMessage:(NSString *)message cancelBtn:(NSString *)btnName okHandler:(void (^)(UIAlertAction *action))handler withParentVC:(UIViewController *)vc;

+ (void)showAlertWithTitle:(NSString *)title andMessage:(NSString *)message cancelBtn:(NSString *)cancelBtnName okBtn:(NSString *)okBtnName okHandler:(void (^)(UIAlertAction *action))handler withParentVC:(UIViewController *)vc;

+ (void)showAlertSheetWithTitle:(NSString *)title andMessage:(NSString *)message cancelBtn:(NSString *)cancelBtnName listArray:(NSArray*)listArray selectHandler:(void (^)(UIAlertAction *action))handler withParentVC:(UIViewController *)vc;


+ (void)callPhoneNum:(NSString *)phone  withController:(UIViewController *)vc;

+ (NSMutableAttributedString *)mutableStringAppendString:(id)str;
+(void)logDic:(NSDictionary *)dic;
+ (void)checkTextField:(UITextField *)textField maxLen:(int)max;
+ (PXAlertView *)showAlert:(NSString *)title msg:(NSString *)msg okHandle:(void(^)(BOOL cancelled, NSInteger buttonIndex))handle;
+ (PXAlertView *)showAlert:(NSString *)title msg:(NSString *)msg handle:(void(^)(BOOL cancelled, NSInteger buttonIndex))handle;


+(UIImage *)grayImage:(UIImage *)sourceImage;

@end
