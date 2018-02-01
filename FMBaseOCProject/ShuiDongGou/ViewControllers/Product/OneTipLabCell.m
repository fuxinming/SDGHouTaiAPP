//
//  WSMsgCell.m
//  SunnyCar
//
//  Created by ZhangQun on 2017/1/12.
//  Copyright © 2017年 shanjin. All rights reserved.
//

#import "OneTipLabCell.h"


@implementation OneTipLabItem
- (instancetype)init
{
    self = [super init];
    if (self) {
        self.cellHeight = 68;
        self.textFont = Font_Size_14;
        self.textColor = COLOR_666;
    }
    return self;
}
@end

@interface OneTipLabCell ()
{
    
}
@end
@implementation OneTipLabCell
@dynamic item;
- (void)cellDidLoad
{
    [super cellDidLoad];
    self.contentView.backgroundColor = [UIColor whiteColor];
    self.backgroundColor = [UIColor whiteColor];
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
    WS(bself);
    [self.contentView removeAllSubviews];
    float alleight = 0;
    float offset = 5;
    for (int i=0; i < self.item.tipArray.count; i++) {
        NSString *t = [self.item.tipArray objectAtIndex:i];
        UILabel *nameLab = [QuickBuild quickBuildLableWithFrame:CGRectZero text:t color:self.item.textColor font:self.item.textFont textAlignment:NSTextAlignmentLeft];
        nameLab.numberOfLines = 0;
        nameLab.frame = CGRectMake(18,alleight, SCREEN_WIDTH - 36 , 22);
        [nameLab sizeToFit];
        alleight += nameLab.height;
        alleight+=offset;
        [self.contentView addSubview:nameLab];
    }
    self.item.cellHeight =alleight + offset;
}
@end
