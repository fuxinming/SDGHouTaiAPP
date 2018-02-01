//
//  FDHouseInfoCell.m
//  SunnyCar
//
//  Created by q on 2017/9/22.
//  Copyright © 2017年 jienliang. All rights reserved.
//

#import "ProductInfoCell.h"

@implementation ProductInfoItem
- (instancetype)init
{
    self = [super init];
    if (self) {
       
        self.cellHeight =  100;
    }
    return self;
}
@end

@interface ProductInfoCell ()
{
}
@end

@implementation ProductInfoCell
@dynamic item;

- (void)cellDidLoad
{
    [super cellDidLoad];
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
    [self.contentView removeAllSubviews];
    
    UIImageView *iconImage = [[UIImageView alloc]initWithFrame:CGRectMake(18, 10, 80, 80)];
    [iconImage sd_setImageWithURL:[NSURL URLWithString:StrRelay(self.item.info[@"main_img_url"])]];
    [self.contentView addSubview:iconImage];
    
    UILabel *nameLabel = [QuickBuild quickBuildLableWithFrame:CGRectMake(116, 15, SCREEN_WIDTH - 116 - 18, 20) text:StrRelay(self.item.info[@"name"]) color:COLOR_333 font:Font_Size_16 textAlignment:NSTextAlignmentLeft];
    [self.contentView addSubview:nameLabel];
    
    UILabel *priceLabel = [QuickBuild quickBuildLableWithFrame:CGRectMake(116, 40, SCREEN_WIDTH- 116 - 18, 20) text:[NSString stringWithFormat:@"￥ %@",StrRelay(self.item.info[@"price"])] color:COLOR_RED_ font:Font_Size_14 textAlignment:NSTextAlignmentLeft];
    [self.contentView addSubview:priceLabel];
    
    
    NSString *status = @"";
    UIColor *bgcolor = [UIColor blackColor];
    if (IntRelay(self.item.info[@"isshow"]) == 0) {
        bgcolor = COLOR_RED_;
        status = @"已下架";
    }
    if (IntRelay(self.item.info[@"isshow"]) == 1) {
        status = @"已上架";
        bgcolor = [UIColor greenColor];
    }
    
    UILabel *staLabel = [QuickBuild quickBuildLableWithFrame:CGRectMake(SCREEN_WIDTH - 18 - 80, 60, 80, 30) text:status color:[UIColor whiteColor] font:Font_Size_16 textAlignment:NSTextAlignmentCenter];
    staLabel.backgroundColor = bgcolor;
    View_Border_Radius(staLabel, 4, 0, Color_Clear);
    [self.contentView addSubview:staLabel];
}

@end
