//
//  SearchViewController.m
//  ShuiDongGou
//
//  Created by q on 2017/10/23.
//  Copyright © 2017年 付新明. All rights reserved.
//

#import "ChangePriceViewController.h"
#import "WSTitleRightInputCell.h"

@interface ChangePriceViewController (){
    WSTitleRightInputItem *itemP1;
}

@end

@implementation ChangePriceViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navBar.title = @"修改价格";
    WS(bself);
        self.navBar.rightItemList = [NSArray arrayWithObject:[FMBarItem itemWith:@"保存" withClick:^(id it) {
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
    itemP1.rightPlaceText = @"输入价格";
    itemP1.keyboardType = UIKeyboardTypeNumberPad;
    [section addItem:itemP1];
    
 
    [self.formManager replaceSectionsWithSectionsFromArray:@[section]];
    [self.formTable reloadData];
}

-(void)dispatchGoods{
    WS(bself);
    if(ISEmptyStr(itemP1.rightText)){
        Toast(@"请输入价格");
        return;
    }
    NSMutableDictionary *dict = [[NSMutableDictionary alloc]init];
    [dict setObject:self.productID forKey:@"id"];
    [dict setObject:itemP1.rightText forKey:@"price"];
    
    [self showLoading];
    [NSObject postDataWithHost:Server_Host Path:ProductChangePrice Param:dict isCache:NO success:^(id json) {
        
        [bself hiddenLoading];
        Toast(@"修改成功");
        RootNavPop(YES);
        FMBlock(self.saveSuccess);
    } fail:^(id json) {
        [bself hiddenLoading];
    }];
    
    
}
@end
