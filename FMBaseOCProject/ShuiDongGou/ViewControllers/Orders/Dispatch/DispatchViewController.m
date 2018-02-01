//
//  SearchViewController.m
//  ShuiDongGou
//
//  Created by q on 2017/10/23.
//  Copyright © 2017年 付新明. All rights reserved.
//

#import "DispatchViewController.h"
#import "WSTitleRightInputCell.h"

@interface DispatchViewController (){
    WSTitleRightInputItem *itemP1;
}

@end

@implementation DispatchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navBar.title = @"订单发货";
    WS(bself);
        self.navBar.rightItemList = [NSArray arrayWithObject:[FMBarItem itemWith:@"发货" withClick:^(id it) {
            [bself dispatchGoods];
    }]];
    self.formManager[@"WSTitleRightInputItem"] = @"WSTitleRightInputCell";
    [self initForm];
}

- (void)initForm
{
    
    WS(bself);
    RETableViewSection *section = [RETableViewSection sectionWithHeaderTitle:@""];

    [section addItem:[[FMEmptyItem alloc] initWithHeight:14]];
  
    itemP1= [[WSTitleRightInputItem alloc]init];
    itemP1.rightPlaceText = @"输入物流公司和单号";
    [section addItem:itemP1];
    
 
    [self.formManager replaceSectionsWithSectionsFromArray:@[section]];
    [self.formTable reloadData];
}

-(void)dispatchGoods{
    WS(bself);
    if(ISEmptyStr(itemP1.rightText)){
        Toast(@"请输入物流公司和单号");
        return;
    }
    NSMutableDictionary *dict = [[NSMutableDictionary alloc]init];
    [dict setObject:self.orderId forKey:@"id"];
    [dict setObject:itemP1.rightText forKey:@"deliveryInfo"];
    
    [self showLoading];
    [NSObject postDataWithHost:Server_Host Path:OrderDelivery Param:dict isCache:NO success:^(id json) {
        
        [bself hiddenLoading];
        Toast(@"发货成功");
        RootNavPop(YES);
        FMBlock(self.saveSuccess);
    } fail:^(id json) {
        [bself hiddenLoading];
    }];
    
    
}
@end
