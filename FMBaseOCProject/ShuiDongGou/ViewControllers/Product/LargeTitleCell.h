//
//  WSMsgCell.h
//  SunnyCar
//
//  Created by ZhangQun on 2017/1/12.
//  Copyright © 2017年 shanjin. All rights reserved.
//
#import "RETableViewCell.h"
#import "RETableViewItem.h"
@interface LargeTitleItem : RETableViewItem
@property (nonatomic,copy)NSString *titleTxt;
@property (nonatomic,copy) NSString *desText;
@property (nonatomic,copy) dispatch_block_t editProp;
@end

@interface LargeTitleCell : RETableViewCell
@property (nonatomic,strong) LargeTitleItem *item;
@end
