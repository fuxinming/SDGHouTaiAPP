//
//  ChangePropertyViewController.h
//  ShuiDongGou
//
//  Created by cx-fu on 2017/11/6.
//  Copyright © 2017年 付新明. All rights reserved.
//

#import "FMFormViewController.h"

@interface ChangeSaleViewController : FMFormViewController
@property (nonatomic,copy)NSArray *propArr;
@property (nonatomic,copy) NSString *productId;
@property (nonatomic,copy) dispatch_block_t saveSuccess;
@end
