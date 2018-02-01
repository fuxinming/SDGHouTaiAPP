//
//  WSFormTextCell.m
//  OMengMerchant
//
//  Created by jienliang on 14-5-9.
//  Copyright (c) 2014年 YK. All rights reserved.
//

#import "WSLoginBtnCell.h"

@implementation WSLoginBtnItem
- (id)init{
    if (self = [super init]) {
        self.cellHeight = 50;
        self.titleText = @"登录";
        self.fontText = FMFontSys(15);
        self.bgColor = [UIColor clearColor];
        self.btnRect = CGRectMake(25, 5, SCREEN_WIDTH-25*2, 50-10);
        self.cofirmColor = [UIColor clearColor];
        self.btnEnable = YES;
        self.isHasCorner = YES;
    }
    return self;
}

@end

@interface WSLoginBtnCell()
{
    UIButton *btn;
}
@end

@implementation WSLoginBtnCell
- (void)cellDidLoad
{
    [super cellDidLoad];
    
    btn = [[UIButton alloc] initWithFrame:CGRectMake(20, 20, SCREEN_WIDTH-20*2, 65-20)];
    btn.layer.cornerRadius = 4;
    [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
//    [btn setBackgroundImage:[FMColor CreateImageFromColor:WS_COLOR_C1] forState:UIControlStateNormal];
//    [btn setBackgroundImage:[FMColor CreateImageFromColor:WS_COLOR_C2] forState:UIControlStateHighlighted];
//    [btn setBackgroundImage:[FMColor CreateImageFromColor:WS_COLOR_C7] forState:UIControlStateDisabled];
    [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(btnPress) forControlEvents:UIControlEventTouchUpInside];
    btn.layer.masksToBounds = YES;
    [self.contentView addSubview:btn];
    
}

- (void)setHighlighted:(BOOL)highlighted animated:(BOOL)animated{}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated{}

- (void)cellWillAppear
{
    [super cellWillAppear];
    self.backgroundColor = self.item.bgColor;
    self.contentView.backgroundColor = self.item.bgColor;
    [btn setTitle:self.item.titleText forState:UIControlStateNormal];
    btn.frame = self.item.btnRect;
    
    if (self.item.titleColor) {
        [btn setTitleColor:self.item.titleColor forState:UIControlStateNormal];
    } else {
        [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    }
    
    if (self.item.borderColor) {
        [btn.layer setMasksToBounds:YES];
        [btn.layer setBorderWidth:1.0f];
        [btn.layer setBorderColor:self.item.borderColor.CGColor];
    }
    
    if (self.item.cornerRadius) {
        btn.layer.cornerRadius = self.item.cornerRadius;
    }
    [btn setBackgroundImage:[QuickBuild quickBuildimageWithColor:self.item.cofirmColor] forState:UIControlStateNormal];
    if (self.item.SelectcofirmColor) {
        [btn setBackgroundImage:[QuickBuild quickBuildimageWithColor:self.item.SelectcofirmColor] forState:UIControlStateHighlighted];
    }
    
    if (!self.item.btnEnable) {
        [btn setBackgroundImage:[QuickBuild quickBuildimageWithColor:COLOR_RED_] forState:UIControlStateNormal];
    }
    
    if (self.item.fontText) {
        btn.titleLabel.font = self.item.fontText;
    }
    
    if (!self.item.isHasCorner) {
        btn.layer.masksToBounds = NO;
        btn.layer.cornerRadius =0;
    }
    btn.enabled = self.item.btnEnable;
    
}

- (void)layoutSubviews
{
    [super layoutSubviews];
}

- (void)btnPress{
    if (self.item.btnPress) {
        self.item.btnPress();
    }
}
@end
