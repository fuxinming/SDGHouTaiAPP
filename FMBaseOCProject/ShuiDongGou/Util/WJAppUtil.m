//
//  WJAppUtil.m
//  阳光好车 SunnyCar
//
//  Created by jienliang on 2017/6/15.
//  Copyright © 2017年 jienliang. All rights reserved.
//

#import "WJAppUtil.h"
#import "WSValidateUtil.h"
#import "AppDelegate.h"
#import "NSMutableAttributedString+Manage.h"
@implementation WJAppUtil

+ (NSMutableDictionary *)getPublicParam {
    NSMutableDictionary *dic = [[NSMutableDictionary alloc] init];
    return dic;
}
//+ (BOOL)paramAddToken:(NSMutableDictionary *)dict with:(UIViewController*)vc {
//    BOOL isG = NO;
//    NSDate* dat = [NSDate dateWithTimeIntervalSinceNow:0];
//    NSTimeInterval a = [dat timeIntervalSince1970];
//
//    AppDelegate *de = (AppDelegate *)[WJUtil appDelegate];
//    double outTime = [[WJUtil strRelay:de.loginInfo.it] doubleValue];
//    if(ISEmptyStr(de.loginInfo.tkn)){
//        [WJAppUtil showAlertWithTitle:@"请先登录" andMessage:@"" cancelBtn:@"确定" okHandler:^(UIAlertAction *action) {
//            [WJLoginInfo clearLoginInfo];
//            WJLoginViewController *login = [[WJLoginViewController alloc] init];
//            login.loginSuccess = ^{
//                WJRootNavPop(YES);
//            };
//            WJRootNavPush(login);
//        } withParentVC:vc];
//        isG  = YES;
//    }else{
//        if (outTime - a*1000 <=0) {
//            [WJAppUtil showAlertWithTitle:@"提示" andMessage:@"当前登录信息已过期，请重新登录" cancelBtn:@"确定" okHandler:^(UIAlertAction *action) {
//                [WJLoginInfo clearLoginInfo];
//                WJLoginViewController *login = [[WJLoginViewController alloc] init];
//                login.loginSuccess = ^{
//                    WJRootNavPop(YES);
//                };
//                WJRootNavPush(login);
//            } withParentVC:vc];
//            isG  = YES;
//        }else{
//            [dict setObject:StrRelay(de.loginInfo.tkn) forKey:@"tkn"];
//            isG  =  NO;
//        }
//    }
//
//    return isG;
//}

+ (UILabel *)createLabWithText:(NSString *)t font:(UIFont *)f textColor:(UIColor *)cc textAliment:(NSTextAlignment)alinement maxWidth:(float)maxW{
    CGSize sz = [CommonUtil sizeForFont:t Font:f CtrlSize:CGSizeMake(maxW, MAXFLOAT)];
    UILabel *lab = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, sz.width, sz.height)];
    lab.font = f;
    lab.textColor = cc;
    lab.text = t;
    lab.textAlignment = alinement;
    lab.numberOfLines = 0;
    lab.userInteractionEnabled = NO;
    return lab;
}

+ (UIButton *)createBtnWithText:(NSString *)t font:(UIFont *)f textColor:(UIColor *)color {
    CGSize sz = [CommonUtil sizeForFont:t Font:f CtrlSize:CGSizeMake(MAXFLOAT, MAXFLOAT)];
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setTitle:t forState:UIControlStateNormal];
    [btn setTitle:t forState:UIControlStateHighlighted];
    [btn setTitleColor:color forState:UIControlStateNormal];
    [btn setTitleColor:color forState:UIControlStateHighlighted];
    btn.titleLabel.font = f;
    btn.frame = CGRectMake(0, 0, sz.width, 30);
    return btn;
}


+ (void)showAlertWithTitle:(NSString *)title andMessage:(NSString *)message cancelBtn:(NSString *)btnName okHandler:(void (^)(UIAlertAction *action))handler withParentVC:(UIViewController *)vc{
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *cancel = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        handler(action);
    }];
    [alertController addAction:cancel];
    [vc presentViewController:alertController animated:YES completion:nil];
}
+ (void)showAlertWithTitle:(NSString *)title andMessage:(NSString *)message cancelBtn:(NSString *)cancelBtnName okBtn:(NSString *)okBtnName okHandler:(void (^)(UIAlertAction *action))handler withParentVC:(UIViewController *)vc{
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:cancelBtnName style:UIAlertActionStyleCancel handler:nil];
    UIAlertAction *okAction = [UIAlertAction actionWithTitle:okBtnName style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        handler(action);
    }];
    [alertController addAction:cancelAction];
    [alertController addAction:okAction];
    
    [vc presentViewController:alertController animated:YES completion:nil];
}

+ (void)showAlertSheetWithTitle:(NSString *)title andMessage:(NSString *)message cancelBtn:(NSString *)cancelBtnName listArray:(NSArray*)listArray selectHandler:(void (^ __nullable)(UIAlertAction *action))handler withParentVC:(UIViewController *)vc{
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:title message:message preferredStyle: UIAlertControllerStyleActionSheet];
    
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:cancelBtnName style:UIAlertActionStyleCancel handler:^(UIAlertAction * action) {
    }];
    [alertController addAction:cancelAction];
    for (int i  = 0; i < listArray.count; i++) {
        NSString *t = listArray[i];
        UIAlertAction *myAction = [UIAlertAction actionWithTitle:t style:UIAlertActionStyleDestructive handler:^(UIAlertAction * action) {
            handler(action);
        }];
        [alertController addAction:myAction];
    }
    
    [vc presentViewController:alertController animated:YES completion:nil];
}

+ (void)callPhoneNum:(NSString *)phone withController:(UIViewController *)vc{
    [WJAppUtil showAlertWithTitle:@"提示" andMessage:@"确认拨打电话吗？" cancelBtn:@"取消" okBtn:@"确定" okHandler:^(UIAlertAction *action) {
        NSString *ph = [NSString stringWithFormat:@"tel://%@",phone];
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:ph]];
    } withParentVC:vc];
    
}

+ (NSMutableAttributedString *)mutableStringAppendString:(id)str{
    NSMutableAttributedString *mutableString = [NSMutableAttributedString new];
    mutableString.clear();
    mutableString.append(str);
    return mutableString;
}

+(void)logDic:(NSDictionary *)dic
{
    NSString *tempStr1 = [[dic description] stringByReplacingOccurrencesOfString:@"\\u" withString:@"\\U"];
    NSString *tempStr2 = [tempStr1 stringByReplacingOccurrencesOfString:@"\"" withString:@"\\\""];
    NSString *tempStr3 = [[@"\"" stringByAppendingString:tempStr2] stringByAppendingString:@"\""];
    NSData *tempData = [tempStr3 dataUsingEncoding:NSUTF8StringEncoding];
    NSString *str = [NSPropertyListSerialization propertyListFromData:tempData mutabilityOption:NSPropertyListImmutable format:NULL errorDescription:NULL];
    NSLog(@"fuxinming - dic:%@",str);
}


+ (void)checkTextField:(UITextField *)textField maxLen:(int)max {
    int kMaxLength = INT_MAX;
    if (max>0) {
        kMaxLength = max;
    }
    NSString *toBeString = textField.text;
    if ([WSValidateUtil stringContainsEmoji:textField.text]) {
        toBeString = [WSValidateUtil disable_emoji:toBeString];
        textField.text = toBeString;
        return;
    }
    
    NSString *lang = [textField.textInputMode primaryLanguage];
    if ([lang isEqualToString:@"zh-Hans"])// 简体中文输入
    {
        //获取高亮部分
        UITextRange *selectedRange = [textField markedTextRange];
        UITextPosition *position = [textField positionFromPosition:selectedRange.start offset:0];
        
        // 没有高亮选择的字，则对已输入的文字进行字数统计和限制
        if (!position)
        {
            if (toBeString.length > kMaxLength)
            {
                textField.text = [toBeString substringToIndex:kMaxLength];
            }
        }
    }
    // 中文输入法以外的直接对其统计限制即可，不考虑其他语种情况
    else
    {
        if (toBeString.length > kMaxLength)
        {
            NSRange rangeIndex = [toBeString rangeOfComposedCharacterSequenceAtIndex:kMaxLength];
            if (rangeIndex.length == 1)
            {
                textField.text = [toBeString substringToIndex:kMaxLength];
            }
            else
            {
                NSRange rangeRange = [toBeString rangeOfComposedCharacterSequencesForRange:NSMakeRange(0, kMaxLength)];
                textField.text = [toBeString substringWithRange:rangeRange];
            }
        }
    }
}

+ (PXAlertView *)showAlert:(NSString *)title msg:(NSString *)msg okHandle:(void(^)(BOOL cancelled, NSInteger buttonIndex))handle
{
    NSString *t = title;
    if (ISEmptyStr(t)) {
        t = @"提示";
    }
    PXAlertView *alert = [PXAlertView showAlertWithTitle:t message:msg cancelTitle:@"确定" completion:handle];
    [alert setCancelButtonTextColor:[UIColor redColor]];
    [alert useDefaultIOS7Style];
    return alert;
}

+ (PXAlertView *)showAlert:(NSString *)title msg:(NSString *)msg handle:(void(^)(BOOL cancelled, NSInteger buttonIndex))handle
{
    NSString *t = title;
    if (ISEmptyStr(t)) {
        t = @"提示";
    }
    PXAlertView *alert = [PXAlertView showAlertWithTitle:t message:msg cancelTitle:@"取消" otherTitle:@"确认" completion:handle];
    [alert setCancelButtonTextColor:[UIColor redColor]];
    [alert useDefaultIOS7Style];
    return alert;
}



//图片置灰
+(UIImage *)grayImage:(UIImage *)sourceImage
{
    int bitmapInfo = kCGImageAlphaNone;
    int width = sourceImage.size.width;
    int height = sourceImage.size.height;
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceGray();
    CGContextRef context = CGBitmapContextCreate (nil,
                                                  width,
                                                  height,
                                                  8,      // bits per component
                                                  0,
                                                  colorSpace,
                                                  bitmapInfo);
    CGColorSpaceRelease(colorSpace);
    if (context == NULL) {
        return nil;
    }
    CGContextDrawImage(context,
                       CGRectMake(0, 0, width, height), sourceImage.CGImage);
    UIImage *grayImage = [UIImage imageWithCGImage:CGBitmapContextCreateImage(context)];
    CGContextRelease(context);
    return grayImage;
}
@end
