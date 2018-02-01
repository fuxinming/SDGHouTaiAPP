//
//  FDHouseInfoCell.m
//  SunnyCar
//
//  Created by q on 2017/9/22.
//  Copyright © 2017年 jienliang. All rights reserved.
//

#import "ProductHeadInfoCell.h"

@implementation ProductHeadInfoItem
- (instancetype)init
{
    self = [super init];
    if (self) {
       
        self.cellHeight =  410;
    }
    return self;
}
@end

@interface ProductHeadInfoCell ()
{
}
@end

@implementation ProductHeadInfoCell
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
    
    UIImageView *iconImage = [[UIImageView alloc]initWithFrame:CGRectMake((SCREEN_WIDTH - 300)/2, 0, 300, 300)];
    [iconImage sd_setImageWithURL:[NSURL URLWithString:StrRelay(self.item.info[@"main_img_url"])]];
    [self.contentView addSubview:iconImage];
    
    UILabel *nameLabel = [QuickBuild quickBuildLableWithFrame:CGRectMake(18, 305, SCREEN_WIDTH - 36, 20) text:StrRelay(self.item.info[@"name"]) color:COLOR_333 font:Font_Size_16 textAlignment:NSTextAlignmentLeft];
    [self.contentView addSubview:nameLabel];
    
    UILabel *priceLabel = [QuickBuild quickBuildLableWithFrame:CGRectMake(18, 335, SCREEN_WIDTH- 36, 30) text:[NSString stringWithFormat:@"￥ %@",StrRelay(self.item.info[@"price"])] color:COLOR_RED_ font:Font_Size_14 textAlignment:NSTextAlignmentLeft];
    [self.contentView addSubview:priceLabel];
    
    UIButton *priceBtn = [QuickBuild quickBuildButtonWithFrame:CGRectMake(SCREEN_WIDTH - 98, priceLabel.top, 80, 30) title:@"修改价格" color:[UIColor whiteColor] font:Font_Size_16 backgroundImage:[QuickBuild quickBuildimageWithColor:Random_Color] target:self action:@selector(priceBtnClick)];
    View_Border_Radius(priceBtn, 4, 0, Color_Clear);
    [self.contentView addSubview:priceBtn];
    
    
    NSString *status = @"";
    NSString *shangorxia = @"";
    UIColor *bgcolor = [UIColor blackColor];
    if (IntRelay(self.item.info[@"isshow"]) == 0) {
        bgcolor = COLOR_RED_;
        status = @"已下架";
        shangorxia = @"上架";
    }
    if (IntRelay(self.item.info[@"isshow"]) == 1) {
        status = @"已上架";
        bgcolor = [UIColor greenColor];
        shangorxia = @"下架";
    }
    
    UILabel *staLabel = [QuickBuild quickBuildLableWithFrame:CGRectMake(18, 370, 80, 30) text:status color:[UIColor whiteColor] font:Font_Size_16 textAlignment:NSTextAlignmentCenter];
    staLabel.backgroundColor = bgcolor;
    View_Border_Radius(staLabel, 4, 0, Color_Clear);
    [self.contentView addSubview:staLabel];
    
    UIButton *shangjiaBtn = [QuickBuild quickBuildButtonWithFrame:CGRectMake(SCREEN_WIDTH - 98, staLabel.top, 80, 30) title:shangorxia color:[UIColor whiteColor] font:Font_Size_16 backgroundImage:[QuickBuild quickBuildimageWithColor:Random_Color] target:self action:@selector(shangjiaBtnClick)];
    View_Border_Radius(shangjiaBtn, 4, 0, Color_Clear);
    [self.contentView addSubview:shangjiaBtn];
}


-(void)priceBtnClick{
    if (self.item.changePrice) {
        self.item.changePrice(@"");
    }
}

-(void)shangjiaBtnClick{
    if (self.item.shangXiaJia) {
        self.item.shangXiaJia(IntRelay(self.item.info[@"isshow"]));
    }
}
@end
