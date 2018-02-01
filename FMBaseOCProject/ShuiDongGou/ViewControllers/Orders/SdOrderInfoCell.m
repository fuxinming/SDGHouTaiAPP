//
//  FDHouseInfoCell.m
//  SunnyCar
//
//  Created by q on 2017/9/22.
//  Copyright © 2017年 jienliang. All rights reserved.
//

#import "SdOrderInfoCell.h"

@implementation SdOrderInfoItem
- (instancetype)init
{
    self = [super init];
    if (self) {
       
        self.cellHeight =  100;
    }
    return self;
}
@end

@interface SdOrderInfoCell ()
{
}
@end

@implementation SdOrderInfoCell
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
    
    UILabel *noLabel = [QuickBuild quickBuildLableWithFrame:CGRectMake(18, 10, SCREEN_WIDTH - 36, 20) text:[NSString stringWithFormat:@"订单号：%@",StrRelay(self.item.info[@"order_no"])] color:COLOR_333 font:Font_Size_24 textAlignment:NSTextAlignmentLeft];
    [noLabel sizeToFit];
    [self.contentView addSubview:noLabel];
    
    UILabel *nameLabel = [QuickBuild quickBuildLableWithFrame:CGRectMake(18, noLabel.bottom + 5, SCREEN_WIDTH - 36, 20) text:[NSString stringWithFormat:@"商品名称：%@",StrRelay(self.item.info[@"snap_name"])] color:COLOR_666 font:Font_Size_14 textAlignment:NSTextAlignmentLeft];
    nameLabel.numberOfLines = 0;
    [nameLabel sizeToFit];
    [self.contentView addSubview:nameLabel];
    
    UILabel *jiaLabel = [QuickBuild quickBuildLableWithFrame:CGRectMake(18, nameLabel.bottom, SCREEN_WIDTH - 36, 20) text:[NSString stringWithFormat:@"商品数量及价格：共%@件，%@元",StrRelay(self.item.info[@"total_count"]),StrRelay(self.item.info[@"total_price"])] color:COLOR_666 font:Font_Size_14 textAlignment:NSTextAlignmentLeft];
    [jiaLabel sizeToFit];
    [self.contentView addSubview:jiaLabel];
    
    UILabel *timeLabel = [QuickBuild quickBuildLableWithFrame:CGRectMake(18, jiaLabel.bottom, SCREEN_WIDTH - 36, 20) text:[NSString stringWithFormat:@"下单时间：%@",StrRelay(self.item.info[@"create_time"])] color:COLOR_666 font:Font_Size_14 textAlignment:NSTextAlignmentLeft];
    [timeLabel sizeToFit];
    [self.contentView addSubview:timeLabel];
    
    
    UITextView *deliAddr = [[UITextView alloc]initWithFrame:CGRectMake(18, timeLabel.bottom + 5,SCREEN_WIDTH - 36, 45)];
    deliAddr.text = [NSString stringWithFormat:@"收货地址：%@ %@ %@%@%@ ",StrRelay(self.item.info[@"snap_address"][@"name"]),StrRelay(self.item.info[@"snap_address"][@"mobile"]),StrRelay(self.item.info[@"snap_address"][@"province"]),StrRelay(self.item.info[@"snap_address"][@"city"]),StrRelay(self.item.info[@"snap_address"][@"detail"])] ;
    deliAddr.font = Font_Size_14;
    [deliAddr setEditable:NO];
    deliAddr.textColor = COLOR_333;
    [self.contentView addSubview:deliAddr];
    
    UIView *line = [[UIView alloc]initWithFrame:CGRectMake(18, deliAddr.bottom + 5, SCREEN_WIDTH - 36, 0.5)];
    line.backgroundColor = COLOR_LINE;
    [self.contentView addSubview:line];
    
    NSString *status = @"";
    UIColor *bgcolor = [UIColor blackColor];
    if (IntRelay(self.item.info[@"status"]) == 1) {
        bgcolor = COLOR_RED_;
        status = @"未付款";
    }
    if (IntRelay(self.item.info[@"status"]) == 2) {
        status = @"已支付";
        bgcolor = [UIColor greenColor];
    }
    if (IntRelay(self.item.info[@"status"]) == 3) {
        status = @"已发货";
        bgcolor = COLOR_BLUE_;
    }
    
    UILabel *staLabel = [QuickBuild quickBuildLableWithFrame:CGRectMake(18, line.bottom + 5, 80, 30) text:status color:[UIColor whiteColor] font:Font_Size_16 textAlignment:NSTextAlignmentCenter];
    staLabel.backgroundColor = bgcolor;
    View_Border_Radius(staLabel, 4, 0, Color_Clear);
    [self.contentView addSubview:staLabel];
    self.item.cellHeight = staLabel.bottom + 5;
    
    if (IntRelay(self.item.info[@"status"]) == 2) {
        UIButton *faBtn = [QuickBuild quickBuildButtonWithFrame:CGRectMake(SCREEN_WIDTH - 98, line.bottom + 5, 80, 30) title:@"发货" color:[UIColor whiteColor] font:Font_Size_16 backgroundImage:[QuickBuild quickBuildimageWithColor:Random_Color] target:self action:@selector(faBtnClcik)];
        [self.contentView addSubview:faBtn];
    }
    if (IntRelay(self.item.info[@"status"]) == 3) {
        
        UITextView *wuliuLabel = [[UITextView alloc]initWithFrame:CGRectMake(staLabel.right,line.bottom + 5, SCREEN_WIDTH - 98 - 18, 25)];
        wuliuLabel.text = StrRelay(self.item.info[@"delivery_info"]);
        wuliuLabel.font = Font_Size_14;
        [wuliuLabel setEditable:NO];
        wuliuLabel.textColor = COLOR_333;
        wuliuLabel.textAlignment = NSTextAlignmentRight;
        wuliuLabel.scrollEnabled = NO;
        [self.contentView addSubview:wuliuLabel];
    }
}
-(void)faBtnClcik{
    if (self.item.dispatchDelivery) {
        self.item.dispatchDelivery(self.item.info[@"id"]);
    }
}

@end
