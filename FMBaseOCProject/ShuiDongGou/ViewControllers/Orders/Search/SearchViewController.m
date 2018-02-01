//
//  SearchViewController.m
//  ShuiDongGou
//
//  Created by q on 2017/10/23.
//  Copyright © 2017年 付新明. All rights reserved.
//

#import "SearchViewController.h"
#import "WSTitleRightInputCell.h"
#import "OrderSearchViewController.h"
@interface SearchViewController (){
    WSTitleRightInputItem *itemP1;
}

@end

@implementation SearchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navBar.title = @"搜索订单";
    WS(bself);
        self.navBar.rightItemList = [NSArray arrayWithObject:[FMBarItem itemWith:@"搜索" withClick:^(id it) {
            [bself searchOrderNo];
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
    itemP1.rightPlaceText = @"输入订单号搜索";
    itemP1.maxLenth = 30;
    [section addItem:itemP1];
    
 
    [self.formManager replaceSectionsWithSectionsFromArray:@[section]];
    [self.formTable reloadData];
}

-(void)searchOrderNo{
    if(ISEmptyStr(itemP1.rightText)){
        Toast(@"请输入订单号进行搜索");
        return;
    }
    
    OrderSearchViewController *vc = [[OrderSearchViewController alloc]init];
    vc.key = itemP1.rightText;
    RootNavPush(vc);
    
}
@end
