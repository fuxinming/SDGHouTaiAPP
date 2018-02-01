//
//  QuickBuild.h
//  FMBaseOCProject
//
//  Created by q on 2017/10/20.
//  Copyright © 2017年 付新明. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface QuickBuild : NSObject
/** 创建UILabel */
+ (UILabel *)quickBuildLableWithFrame:(CGRect)frame
                                 text:(NSString *)text
                                color:(UIColor *)color
                                 font:(UIFont *)font
                        textAlignment:(NSTextAlignment)textAlignment;


/** 创建UITextField */
+ (UITextField *)quickBuildTextFieldWithFrame:(CGRect)frame
                                  placeholder:(NSString *)placeholder
                                        color:(UIColor *)color
                                         font:(UIFont *)font
                              secureTextEntry:(BOOL)secureTextEntry
                                     delegate:(id)delegate;
/** 创建UITextView */
+ (UITextView *)quickBuildTextViewWithFrame:(CGRect)frame
                                       text:(NSString *)text
                                      color:(UIColor *)color
                                       font:(UIFont *)font
                              textAlignment:(NSTextAlignment)textAlignment;

/** 创建UIButton */
+ (UIButton *)quickBuildButtonWithFrame:(CGRect)frame
                                  title:(NSString *)title
                                  color:(UIColor *)color
                                   font:(UIFont *)font
                        backgroundImage:(UIImage *)backgroundImage
                                 target:(id)target
                                 action:(SEL)action;
/** 创建图片控件 */
+ (UIImageView*) quickBuildImageViewWithFrame:(CGRect)frame
                                        image:(UIImage*)image;

/** 创建带颜色图片 */
+ (UIImage*) quickBuildimageWithColor:(UIColor*)color;
@end
