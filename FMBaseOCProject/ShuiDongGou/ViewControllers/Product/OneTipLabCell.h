//
//  WSMsgCell.h
//  SunnyCar
//
//  Created by ZhangQun on 2017/1/12.
//  Copyright © 2017年 shanjin. All rights reserved.
//
#import "RETableViewCell.h"
#import "RETableViewItem.h"
@interface OneTipLabItem : RETableViewItem
@property (nonatomic,copy) UIFont *textFont;
@property (nonatomic,copy) UIColor *textColor;
@property (nonatomic,copy) NSMutableArray *tipArray;
@end

@interface OneTipLabCell : RETableViewCell
@property (nonatomic,strong) OneTipLabItem *item;
@end
