//
//  WSTitleTextCell.h
//  SunnyCar
//
//  Created by jienliang on 2017/1/12.
//  Copyright © 2017年 jienliang. All rights reserved.
//
#import "RETableViewCell.h"
#import "RETableViewItem.h"

@interface WSMultiTwoEditItem : RETableViewItem
@property (nonatomic,copy) NSString *fieldText1;
@property (nonatomic,copy) NSString *fieldText2;

@property (nonatomic,copy) NSString *placeHolderText1;
@property (nonatomic,copy) NSString *placeHolderText2;

@property (nonatomic,copy) UIFont *font;
@property (nonatomic,assign) UIKeyboardType keyboardType;

@property (nonatomic,assign) int maxLen;
@end

@interface WSMultiTwoEditCell : RETableViewCell
@property (nonatomic,strong) WSMultiTwoEditItem *item;
@end
