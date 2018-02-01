//
//  ProductViewController.m
//  ShuiDongGou
//
//  Created by q on 2017/10/24.
//  Copyright © 2017年 付新明. All rights reserved.
//

#import "ProductViewController.h"
#import "ProductInfoCell.h"
#import "ProductDetailViewController.h"
#import "AddProductViewController.h"
@interface ProductViewController ()

@end

@implementation ProductViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    WS(bself);
    self.navBar.title = @"商品列表";
    self.navBar.rightItemList = [NSArray arrayWithObject:[FMBarItem itemWith:@"添加商品" withClick:^(id it) {
        [bself addProduct];
    }]];
    self.formManager[@"ProductInfoItem"] = @"ProductInfoCell";
    [self getData];
}

-(void)getData{
    WS(bself);
    [self showLoading];
    [NSObject getDataWithHost:Server_Host Path:ProductAll Param:nil isCache:NO success:^(id json) {
        [self initForm:json];
        [bself hiddenLoading];
    } fail:^(id json) {
        [bself hiddenLoading];
        Toast(@"请求失败，请稍后重试");
    }];
}
- (void)initForm:(NSArray *)list
{
    
    WS(bself);
    RETableViewSection *section = [RETableViewSection sectionWithHeaderTitle:@""];
    
    for (int i = 0; i < list.count; i++) {
        NSDictionary *dcit = [list objectAtIndex:i];
        ProductInfoItem *it = [[ProductInfoItem alloc]init];
        it.info = dcit;
        it.selectionHandler = ^(ProductInfoItem * item) {
            ProductDetailViewController *vc = [[ProductDetailViewController alloc]init];
            vc.productId = item.info[@"id"];
            RootNavPush(vc);
        };
        [section addItem:it];
        [section addItem:[[FMEmptyItem alloc] initWithHeight:17]];
    }
    
    
    [self.formManager replaceSectionsWithSectionsFromArray:@[section]];
    [self.formTable reloadData];
}

-(void)addProduct{
    WS(bself);
    AddProductViewController *vc = [[AddProductViewController alloc]init];
    vc.saveSuccess = ^{
        [bself getData];
    };
    RootNavPush(vc);
}
@end
