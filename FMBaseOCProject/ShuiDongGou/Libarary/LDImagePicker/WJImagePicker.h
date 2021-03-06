//
//  WJImagePicker.h
//  ImageClipTool
//
//  Created by 段乾磊 on 16/7/6.
//  Copyright © 2016年 LazyDuan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
typedef NS_ENUM(NSInteger,ImagePickerType)
{
    ImagePickerCamera = 0,
    ImagePickerPhoto = 1
};
@class WJImagePicker;
@protocol WJImagePickerDelegate <NSObject>

- (void)imagePicker:(WJImagePicker *)imagePicker didFinished:(UIImage *)editedImage;
- (void)imagePickerDidCancel:(WJImagePicker *)imagePicker;
@end
@interface WJImagePicker : NSObject
+ (instancetype) sharedInstance;
//选择原图片
- (void)showOriginalImagePickerWithType:(ImagePickerType)type InViewController:(UIViewController *)viewController;
//scale 裁剪框的高宽比 0~1.5 默认为1
- (void)showImagePickerWithType:(ImagePickerType)type InViewController:(UIViewController *)viewController Scale:(double)scale;
//代理
@property (nonatomic, assign) id<WJImagePickerDelegate> delegate;
@end
