//
//  SearchViewController.h
//  ShuiDongGou
//
//  Created by q on 2017/10/23.
//  Copyright © 2017年 付新明. All rights reserved.
//

#import "FMFormViewController.h"

@interface DispatchViewController : FMFormViewController
@property (nonatomic,copy) NSString *orderId;
@property (nonatomic,copy) dispatch_block_t saveSuccess;
@end
