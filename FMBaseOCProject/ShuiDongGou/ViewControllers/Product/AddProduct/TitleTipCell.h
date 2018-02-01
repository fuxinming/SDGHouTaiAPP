//
//  FMFormTextCell.h
//  OMengMerchant
//
//  Created by fuxinming on 14-5-9.
//  Copyright (c) 2014年 fuxinming. All rights reserved.
//

#import "RETableViewCell.h"
#import "RETableViewItem.h"

@interface TitleTipItem : FMBaseItem
@property (nonatomic,copy) NSString *t1;
@property (nonatomic,copy) NSString *t2;
@property (nonatomic,copy) NSString *leftImage;
@property (nonatomic,assign) float marginLeft;

@property (nonatomic,assign) BOOL haveArrow;
@property (nonatomic,assign) BOOL haveLine;
@end

@interface TitleTipCell : FMBaseCell
@property (strong, readwrite, nonatomic) TitleTipItem *item;

@end
