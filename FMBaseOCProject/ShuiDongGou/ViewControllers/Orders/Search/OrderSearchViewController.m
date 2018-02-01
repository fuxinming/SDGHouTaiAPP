//
//  OrdersViewController.m
//  ShuiDongGou
//
//  Created by q on 2017/10/23.
//  Copyright © 2017年 付新明. All rights reserved.
//

#import "OrderSearchViewController.h"
#import "SdOrderInfoCell.h"

@interface OrderSearchViewController ()

@end

@implementation OrderSearchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navBar.title = @"搜索结果";
    self.formManager[@"SdOrderInfoItem"] = @"SdOrderInfoCell";
    [self beginRefrash];
}

- (void)requestWithPage:(int)pageIndex {
    WS(bself);
    NSMutableDictionary *dict = [[NSMutableDictionary alloc]init];
    [dict setObject:@"10" forKey:@"size"];
    [dict setObject:[NSNumber numberWithInt:pageIndex] forKey:@"page"];
    [dict setObject:self.key forKey:@"key"];
    [NSObject getDataWithHost:Server_Host Path:OrderSearch Param:dict isCache:NO success:^(id json) {
        NSMutableArray *houseArr = [[NSMutableArray alloc] init];
        if ([json[@"data"] isKindOfClass:[NSArray class]]) {
            [houseArr addObjectsFromArray:json[@"data"]];
        }
        if (houseArr.count == 10) {
            self.hasNextPage = 1;
        }else{
            self.hasNextPage = -1;
        }
        if (pageIndex == 1&& houseArr.count == 0) {
            Toast(@"没有搜索结果");
        }else{
            [bself requestFinish:[bself getDataArray:json]];
        }
        
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
    
    NSMutableArray *arrayItems = [[NSMutableArray alloc] init];
    
    for (int i = 0; i < array.count; i++) {
        NSDictionary *dic = [array objectAtIndex:i];
        SdOrderInfoItem *item1 = [[SdOrderInfoItem alloc]init];
        item1.info = dic;
        [arrayItems addObject:item1];
        [arrayItems addObject:[[FMEmptyItem alloc] initWithHeight:17]];
    }
    return arrayItems;
}
@end
