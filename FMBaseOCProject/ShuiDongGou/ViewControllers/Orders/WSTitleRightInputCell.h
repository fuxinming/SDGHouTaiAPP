//
//  WSTitleTextCell.h
//  SunnyCar
//
//  Created by jienliang on 2017/1/12.
//  Copyright © 2017年 jienliang. All rights reserved.
//
#import "RETableViewCell.h"
#import "RETableViewItem.h"
@interface WSTitleRightInputItem : RETableViewItem
@property (nonatomic,copy) NSString *titleText;
@property (nonatomic,copy) NSString *rightText;
@property (nonatomic,copy) NSString *rightPlaceText;
@property (nonatomic,copy) UIColor *rightTextColor;
@property (nonatomic,assign) int  maxLenth;
@property (nonatomic,assign) UIKeyboardType  keyboardType;
@property (nonatomic,assign) BOOL hasLine;
@end

@interface WSTitleRightInputCell : RETableViewCell
@property (nonatomic,strong) WSTitleRightInputItem *item;
@end
