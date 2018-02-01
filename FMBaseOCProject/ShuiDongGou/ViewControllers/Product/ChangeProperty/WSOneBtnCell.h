//
//  WSFormTextCell.h
//  OMengMerchant
//
//  Created by jienliang on 14-5-9.
//  Copyright (c) 2014年 YK. All rights reserved.
//

#import "RETableViewCell.h"
#import "RETableViewItem.h"

@interface WSOneBtnItem : RETableViewItem
@property (nonatomic,copy) NSString *titleText;
@property (nonatomic,copy) UIColor *titleColor;
@property (nonatomic,copy) UIFont *titleFont;

@property (nonatomic,assign) CGRect btnRect;

@property (copy, readwrite, nonatomic) void (^btnPress)(void);


@end

@interface WSOneBtnCell : RETableViewCell
@property (strong, readwrite, nonatomic) WSOneBtnItem *item;

@end
