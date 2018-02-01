//
//  FMFormTextCell.m
//  OMengMerchant
//
//  Created by fuxinming on 14-5-9.
//  Copyright (c) 2014年 fuxinming. All rights reserved.
//

#import "TitleTipCell.h"

@implementation TitleTipItem
- (id)init{
    if (self = [super init]) {
        self.cellHeight = 48;
        self.haveArrow = YES;
        self.haveLine = YES;
    }
    return self;
}

@end

@interface TitleTipCell()
{
    UIImageView *leftImage;
    UILabel *lab1;
    UILabel *lab2;
    UIImageView *rightImage;
    UIView *lineView;
}
@end

@implementation TitleTipCell
@dynamic item;
- (void)cellDidLoad
{
    [super cellDidLoad];
    self.backgroundColor = [UIColor clearColor];
    self.contentView.backgroundColor = [UIColor whiteColor];
    
    leftImage = [[UIImageView alloc]init];
    [self.contentView addSubview:leftImage];
    
    lab1 = [self createLabel:@"" color:COLOR_333 font:Font_Size_14];
    lab1.frame = CGRectMake(0, 14, SCREEN_WIDTH/2, 18);
    lab1.textAlignment = NSTextAlignmentLeft;
    [self.contentView addSubview:lab1];
    
    lab2 = [self createLabel:@"" color:COLOR_999 font:Font_Size_13];
    lab2.frame = CGRectMake(0, lab1.bottom + 6, SCREEN_WIDTH/2, 15);
    lab2.textAlignment = NSTextAlignmentRight;
    [self.contentView addSubview:lab2];
    
    rightImage = [[UIImageView alloc]initWithFrame:CGRectMake(SCREEN_WIDTH - 15 - 14, 12.5, 15, 15)];
    rightImage.image = [UIImage imageNamed:@"rightArr"];
    [self.contentView addSubview:rightImage];

    lineView = [[UIView alloc]initWithFrame:CGRectMake(14, 47.5, SCREEN_WIDTH - 14, 0.5)];
    lineView.backgroundColor = COLOR_LIGHTGRAY;
    [self.contentView addSubview:lineView];
    
}

- (void)setHighlighted:(BOOL)highlighted animated:(BOOL)animated{}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated{}

- (void)cellWillAppear
{
    [super cellWillAppear];
    lab1.text = StrRelay(self.item.t1);
    [lab1 sizeToFit];
    lab2.text = StrRelay(self.item.t2);
    [lab2 sizeToFit];
    
    if (ISEmptyStr(self.item.leftImage)) {
        lab1.frame = CGRectMake(14, 0, lab1.width, 48);
    }else{
        leftImage.image = [UIImage imageNamed:self.item.leftImage];
        leftImage.frame = CGRectMake(14, 13, 24, 24);
        lab1.frame = CGRectMake(leftImage.right + 14, 0, lab1.width, 48);
    }
    
    if (self.item.haveArrow) {
        rightImage.hidden = NO;
        lab2.frame = CGRectMake(SCREEN_WIDTH - 30 - lab2.width, 0, lab2.width, 48);
    }else{
        rightImage.hidden = YES;
        lab2.frame = CGRectMake(SCREEN_WIDTH - 15 - lab2.width, 0, lab2.width, 48);
    }
    lineView.hidden = !self.item.haveLine;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
}

@end
