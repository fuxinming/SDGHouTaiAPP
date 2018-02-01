//
//  WSMsgCell.m
//  SunnyCar
//
//  Created by ZhangQun on 2017/1/12.
//  Copyright © 2017年 shanjin. All rights reserved.
//

#import "LargeTitleCell.h"

@implementation LargeTitleItem
- (instancetype)init
{
    self = [super init];
    if (self) {

        self.cellHeight = 80;
    }
    return self;
}
@end

@interface LargeTitleCell ()
{
    UILabel *tLab;
    UILabel *desLab;
}
@end
@implementation LargeTitleCell
@dynamic item;
- (void)cellDidLoad
{
    [super cellDidLoad];
    self.contentView.backgroundColor = [UIColor whiteColor];
    self.backgroundColor = [UIColor whiteColor];
    tLab = [[UILabel alloc] init];
    tLab.frame = CGRectMake(18, 24, SCREEN_WIDTH - 36, 33);
    tLab.font = [UIFont fontWithName:@"PingFangSC-Medium" size:24];
    tLab.textColor = [UIColor colorWithRed:0/255.0 green:0/255.0 blue:0/255.0 alpha:0.8/1.0];
    [self.contentView addSubview:tLab];
    
    desLab = [[UILabel alloc] initWithFrame:CGRectMake(18, tLab.bottom, SCREEN_WIDTH - 36, 16)];
    desLab.font = Font_Size_11;
    desLab.textColor = COLOR_999;
    [self.contentView addSubview:desLab];
    
    UIButton *shangjiaBtn = [QuickBuild quickBuildButtonWithFrame:CGRectMake(SCREEN_WIDTH - 98, 25, 80, 30) title:@"修改" color:[UIColor whiteColor] font:Font_Size_16 backgroundImage:[QuickBuild quickBuildimageWithColor:Random_Color] target:self action:@selector(shangjiaBtnClick)];
    View_Border_Radius(shangjiaBtn, 4, 0, Color_Clear);
    [self.contentView addSubview:shangjiaBtn];
}

- (void)setHighlighted:(BOOL)highlighted animated:(BOOL)animated{}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated{}
- (void)layoutSubviews
{
    [super layoutSubviews];
}

- (void)cellWillAppear
{
    [super cellWillAppear];
    tLab.text = self.item.titleTxt;
    desLab.text = [CommonUtil strRelay:self.item.desText];
}

-(void)shangjiaBtnClick{
    if (self.item.editProp) {
        self.item.editProp();
    }
}
@end
