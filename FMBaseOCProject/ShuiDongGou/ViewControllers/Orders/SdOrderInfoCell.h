//
//  FDHouseInfoCell.h
//  SunnyCar
//
//  Created by q on 2017/9/22.
//  Copyright © 2017年 jienliang. All rights reserved.
//

#import "RETableViewCell.h"
#import "RETableViewItem.h"
@interface SdOrderInfoItem : RETableViewItem
@property (nonatomic,copy) NSDictionary *info;
@property (nonatomic,copy) void (^dispatchDelivery)(NSString *orderId);
@end
@interface SdOrderInfoCell : RETableViewCell
@property (nonatomic,strong) SdOrderInfoItem *item;
@end
