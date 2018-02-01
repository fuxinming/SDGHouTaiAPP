//
//  WSFormTextCell.m
//  OMengMerchant
//
//  Created by jienliang on 14-5-9.
//  Copyright (c) 2014年 YK. All rights reserved.
//

#import "WSOneBtnCell.h"

@implementation WSOneBtnItem
- (id)init{
    if (self = [super init]) {
        self.cellHeight = 60;
        self.titleColor = [UIColor whiteColor];
        self.titleFont = FMFontSys(21);
        self.btnRect = CGRectMake(25, 5, SCREEN_WIDTH-25*2, 50-10);
    }
    return self;
}

@end

@interface WSOneBtnCell()
{
    UIButton *btn;
}
@end

@implementation WSOneBtnCell
- (void)cellDidLoad
{
    [super cellDidLoad];
    self.backgroundColor = [UIColor clearColor];
    self.contentView.backgroundColor = [UIColor clearColor];
    btn = [[UIButton alloc] initWithFrame:CGRectMake(20, 20, SCREEN_WIDTH-20*2, 65-20)];
    [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(btnPress) forControlEvents:UIControlEventTouchUpInside];
    [self.contentView addSubview:btn];
    
}

- (void)setHighlighted:(BOOL)highlighted animated:(BOOL)animated{}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated{}

- (void)cellWillAppear
{
    [super cellWillAppear];
    [btn setTitle:self.item.titleText forState:UIControlStateNormal];
    btn.frame = self.item.btnRect;
    [btn setTitleColor:self.item.titleColor forState:UIControlStateNormal];
    
    btn.titleLabel.font = self.item.titleFont;
    btn.frame = self.item.btnRect;
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
