//
//  FDHouseInfoCell.h
//  SunnyCar
//
//  Created by q on 2017/9/22.
//  Copyright © 2017年 jienliang. All rights reserved.
//

#import "RETableViewCell.h"
#import "RETableViewItem.h"
@interface ProductHeadInfoItem : RETableViewItem
@property (nonatomic,copy) NSDictionary *info;
@property (nonatomic,copy) void (^changePrice)(NSString *orderId);
@property (nonatomic,copy) void (^shangXiaJia)(int isShow);
@end
@interface ProductHeadInfoCell : RETableViewCell
@property (nonatomic,strong) ProductHeadInfoItem *item;
@end
