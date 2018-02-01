//
//  WSFormTextCell.h
//  OMengMerchant
//
//  Created by jienliang on 14-5-9.
//  Copyright (c) 2014年 YK. All rights reserved.
//

#import "RETableViewCell.h"
#import "RETableViewItem.h"

@interface WSLoginBtnItem : RETableViewItem
@property (nonatomic,copy) NSString *titleText;
@property (nonatomic,copy) UIColor *titleColor;
@property (nonatomic,copy) UIColor *bgColor;
@property (nonatomic,copy) UIColor *borderColor;
@property (nonatomic,copy) UIColor *cofirmColor;
@property (nonatomic,copy) UIColor *SelectcofirmColor;

@property (nonatomic,assign) CGRect btnRect;
@property (nonatomic,assign) CGFloat cornerRadius;
@property (nonatomic,strong) UIFont *fontText;
@property (nonatomic,assign) BOOL isHasCorner;
@property (copy, readwrite, nonatomic) void (^btnPress)(void);

@property (nonatomic,assign) BOOL btnEnable;


@end

@interface WSLoginBtnCell : RETableViewCell
@property (strong, readwrite, nonatomic) WSLoginBtnItem *item;

@end
