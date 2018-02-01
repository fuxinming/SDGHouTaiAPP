//
//  WPhotoViewController.h
//  SunnyCar
//
//  Created by q on 2017/7/21.
//  Copyright © 2017年 jienliang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseViewController.h"
#import "myPhotoCell.h"
@interface WPhotoViewController : BaseViewController
//所有照片组内的url数组（内部是最大的相册的照片url，这个相册一般名字是 所有照片或All Photos）
@property (nonatomic, strong) NSArray *allPhotoArr;
@property (nonatomic, assign) int maxCount;
@property (nonatomic, copy)void (^saveSuceess)(NSArray *arr);
@end
