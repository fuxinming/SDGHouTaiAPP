//
//  BaseViewController.h
//  ShuiDongGou
//
//  Created by q on 2017/10/20.
//  Copyright © 2017年 付新明. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FMNavBar.h"
#import "MJRefresh.h"
@interface BaseViewController : UIViewController
@property (nonatomic,copy) NSString *myTitle;
/**
 *    @brief    导航栏是否隐藏, 默认NO.
 */
@property (nonatomic, assign) BOOL navHidden;
/**
 *    @brief    返回是否隐藏, 默认NO.
 */
@property (nonatomic, assign) BOOL hiddenBack;
/**
 *    @brief    导航栏视图.
 */
@property (nonatomic, strong) FMNavBar *navBar;
@property (nonatomic, strong) UIView *backGroundView;

- (void)showLoading;
- (void)hiddenLoading;
@end
