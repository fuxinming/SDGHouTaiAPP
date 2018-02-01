//
//  FDHouseInfoCell.h
//  SunnyCar
//
//  Created by q on 2017/9/22.
//  Copyright © 2017年 jienliang. All rights reserved.
//

#import "RETableViewCell.h"
#import "RETableViewItem.h"
@interface ChoosePictureItem : RETableViewItem
@property (nonatomic,weak) UIViewController *parentV;
@property (nonatomic,copy) NSString *filePath;
@end
@interface ChoosePictureCell : RETableViewCell
@property (nonatomic,strong) ChoosePictureItem *item;
@end
