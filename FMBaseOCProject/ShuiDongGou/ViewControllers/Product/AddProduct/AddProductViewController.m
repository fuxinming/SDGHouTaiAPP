//
//  AddProductViewController.m
//  ShuiDongGou
//
//  Created by cx-fu on 2017/11/6.
//  Copyright © 2017年 付新明. All rights reserved.
//

#import "AddProductViewController.h"
#import "WSTitleRightInputCell.h"
#import "TitleTipCell.h"
#import "WPhotoViewController.h"
@interface AddProductViewController (){
    WSTitleRightInputItem *itemT1;
    WSTitleRightInputItem *itemP1;
    TitleTipItem *item01;
}

@end

@implementation AddProductViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    WS(bself);
    self.navBar.title = @"添加商品";
    self.formManager[@"WSTitleRightInputItem"] = @"WSTitleRightInputCell";
    self.formManager[@"TitleTipItem"] = @"TitleTipCell";
    self.navBar.rightItemList = [NSArray arrayWithObject:[FMBarItem itemWith:@"保存" withClick:^(id it) {
        [bself saveProduct];
    }]];
    [self initForm];
}

-(void)initForm{
    WS(bself);
    RETableViewSection *section = [RETableViewSection sectionWithHeaderTitle:@""];
    
    [section addItem:[[FMEmptyItem alloc] initWithHeight:14]];
    
    itemT1= [[WSTitleRightInputItem alloc]init];
    itemT1.rightPlaceText = @"输入商品名称";
    [section addItem:itemT1];
    
    [section addItem:[[FMEmptyItem alloc] initWithHeight:14]];
    
    itemP1= [[WSTitleRightInputItem alloc]init];
    itemP1.rightPlaceText = @"输入商品价格";
    itemP1.keyboardType = UIKeyboardTypeNumberPad;
    [section addItem:itemP1];
    
    [section addItem:[[FMEmptyItem alloc] initWithHeight:14]];
    
    item01 = [[TitleTipItem alloc]init];
    item01.t1 = @"选择头图";
    item01.selectionHandler = ^(id item) {
        [bself getAllImage];
    };
    [section addItem:item01];
    
    [self.formManager replaceSectionsWithSectionsFromArray:@[section]];
    [self.formTable reloadData];
}

-(void)saveProduct{
    WS(bself);
    if (ISEmptyStr(itemT1.rightText)) {
        Toast(@"商品名称不能为空");
        return;
    }
    
    if (ISEmptyStr(itemP1.rightText)) {
        Toast(@"商品价格不能为空");
        return;
    }
    
    if (ISEmptyStr(item01.t2)) {
        Toast(@"商品头图不能为空");
        return;
    }
    
    NSMutableDictionary *dict = [[NSMutableDictionary alloc]init];
    [dict setObject:itemT1.rightText forKey:@"name"];
    [dict setObject:itemP1.rightText forKey:@"price"];
    [dict setObject:item01.t2 forKey:@"mainUrl"];
    [self showLoading];
    [NSObject postDataWithHost:Server_Host Path:ProductAdd Param:dict isCache:NO success:^(id json) {
        
        [bself hiddenLoading];
        Toast(@"添加成功");
        RootNavPop(YES);
        FMBlock(self.saveSuccess);
    } fail:^(id json) {
        [bself hiddenLoading];
    }];
}

-(void)getAllImage{
    WS(bself);
    [self showLoading];
    [NSObject getDataWithHost:Server_Host Path:ImageAll Param:nil isCache:NO success:^(id json) {
        
        [bself hiddenLoading];
        
        WPhotoViewController *vc = [[WPhotoViewController alloc]init];
        vc.allPhotoArr = json;
        vc.maxCount = 1;
        vc.saveSuceess = ^(NSArray *arr) {
            NSDictionary *dic = arr[0];
            NSString *str = StrRelay(dic[@"url"]);
            NSArray *strArr = [str componentsSeparatedByString:@"/"];
            item01.t2 = strArr.lastObject;
            item01.userInfo = dic;
            [item01 reloadRowWithAnimation:UITableViewRowAnimationNone];
        };
        RootNavPush(vc);
    } fail:^(id json) {
        [bself hiddenLoading];
        Toast(@"请求失败，请稍后重试");
    }];
}

@end
