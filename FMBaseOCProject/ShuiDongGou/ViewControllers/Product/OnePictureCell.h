//
//  FDHouseInfoCell.h
//  SunnyCar
//
//  Created by q on 2017/9/22.
//  Copyright © 2017年 jienliang. All rights reserved.
//

#import "RETableViewCell.h"
#import "RETableViewItem.h"
@interface OnePictureItem : RETableViewItem
@property (nonatomic,copy) NSString *urlStr;
@end
@interface OnePictureCell : RETableViewCell
@property (nonatomic,strong) OnePictureItem *item;
@end
