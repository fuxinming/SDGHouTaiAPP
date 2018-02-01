//
//  OrdersViewController.m
//  ShuiDongGou
//
//  Created by q on 2017/10/23.
//  Copyright © 2017年 付新明. All rights reserved.
//

#import "OrdersViewController.h"
#import "SdOrderInfoCell.h"
#import "SearchViewController.h"
#import "DispatchViewController.h"
@interface OrdersViewController ()

@end

@implementation OrdersViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navBar.title = @"订单列表";
    self.navBar.rightItemList = [NSArray arrayWithObject:[FMBarItem itemImg:@"Icon_search_red" withClick:^(id it) {
        SearchViewController *vc = [[SearchViewController alloc]init];
        RootNavPush(vc);
    }]];
    self.formManager[@"SdOrderInfoItem"] = @"SdOrderInfoCell";
    [self beginRefrash];
}

- (void)requestWithPage:(int)pageIndex {
    WS(bself);
    NSMutableDictionary *dict = [[NSMutableDictionary alloc]init];
    [dict setObject:@"10" forKey:@"size"];
    [dict setObject:[NSNumber numberWithInt:pageIndex] forKey:@"page"];
    [NSObject getDataWithHost:Server_Host Path:Orders Param:dict isCache:NO success:^(id json) {
        NSMutableArray *houseArr = [[NSMutableArray alloc] init];
        if ([json[@"data"] isKindOfClass:[NSArray class]]) {
            [houseArr addObjectsFromArray:json[@"data"]];
        }
        if (houseArr.count == 10) {
            self.hasNextPage = 1;
        }else{
            self.hasNextPage = -1;
        }
        [bself requestFinish:[bself getDataArray:json]];
        [self requestComplete];
    } fail:^(id json) {
        [self requestComplete];
        Toast(@"请求失败，请稍后重试");
    }];
}

- (NSMutableArray *)getDataArray:(id)json {
    NSMutableArray *ar = [[NSMutableArray alloc] init];
    if ([json[@"data"] isKindOfClass:[NSArray class]]) {
        [ar addObjectsFromArray:json[@"data"]];
    }
    return ar;
}

- (NSMutableArray *)createItems:(NSArray *)array
{
    WS(bself);
    NSMutableArray *arrayItems = [[NSMutableArray alloc] init];
    
    for (int i = 0; i < array.count; i++) {
        NSDictionary *dic = [array objectAtIndex:i];
        SdOrderInfoItem *item1 = [[SdOrderInfoItem alloc]init];
        item1.info = dic;
        item1.dispatchDelivery = ^(NSString *orderId) {
            DispatchViewController *vc = [[DispatchViewController alloc]init];
            vc.saveSuccess = ^{
                [bself beginRefrash];
            };
            vc.orderId = orderId;
			RootNavPush(vc);
        };
        [arrayItems addObject:item1];
        [arrayItems addObject:[[FMEmptyItem alloc] initWithHeight:17]];
    }
    return arrayItems;
}
@end
