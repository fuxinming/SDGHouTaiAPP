//
//  ProductViewController.m
//  ShuiDongGou
//
//  Created by q on 2017/10/24.
//  Copyright © 2017年 付新明. All rights reserved.
//

#import "ProductDetailViewController.h"

#import "ProductHeadInfoCell.h"
#import "LargeTitleCell.h"
#import "OneTipLabCell.h"
#import "OnePictureCell.h"
#import "ChangePriceViewController.h"
#import "ChangePropertyViewController.h"
#import "ChangeSaleViewController.h"
#import "WPhotoViewController.h"
@interface ProductDetailViewController ()

@end

@implementation ProductDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navBar.title = @"商品详情";
    self.formManager[@"ProductHeadInfoItem"] = @"ProductHeadInfoCell";
    self.formManager[@"LargeTitleItem"] = @"LargeTitleCell";
    self.formManager[@"OneTipLabItem"] = @"OneTipLabCell";
    self.formManager[@"OnePictureItem"] = @"OnePictureCell";
    [self getData];
}

-(void)getData{
    WS(bself);
    [self showLoading];
    NSString *url = [NSString stringWithFormat:@"%@%@%@",Server_Host,ProductDetail,self.productId];
    [NSObject getDataWithUrl:url success:^(id json) {
        [self initForm:json];
        [bself hiddenLoading];
    } fail:^(id json) {
        [bself hiddenLoading];
        Toast(@"请求失败，请稍后重试");
    }];
}
- (void)initForm:(id)json
{
    
    WS(bself);
    RETableViewSection *section = [RETableViewSection sectionWithHeaderTitle:@""];

    ProductHeadInfoItem *it1 = [[ProductHeadInfoItem alloc]init];
    it1.info = json;
    it1.changePrice = ^(NSString *orderId) {
        ChangePriceViewController *vc = [[ChangePriceViewController alloc]init];
        vc.productID = bself.productId;
        vc.saveSuccess = ^{
            [bself getData];
           
        };
        
        RootNavPush(vc);
    };
    it1.shangXiaJia = ^(int isShow) {
        [bself shangOrXia:isShow];
    };
    [section addItem:it1];
    
    [section addItem:[[FMEmptyItem alloc] initWithHeight:10]];
    
    
    NSMutableArray *propArr = [NSMutableArray arrayWithArray:json[@"properties"]];
    NSMutableArray *strArr = [[NSMutableArray alloc]init];
    for (NSDictionary *dict in propArr) {
        NSString *str = [NSString stringWithFormat:@"%@ : %@",StrRelay(dict[@"name"]),StrRelay(dict[@"detail"])];
        [strArr addObject:str];
    }
    
    LargeTitleItem *itemL1 = [[LargeTitleItem alloc]init];
    itemL1.titleTxt = @"属性详情";
    itemL1.editProp = ^{
        ChangePropertyViewController *vc = [[ChangePropertyViewController alloc]init];
        vc.propArr = propArr;
        vc.productId = self.productId;
        vc.saveSuccess = ^{
            [bself getData];
        };
        RootNavPush(vc);
    };
    [section addItem:itemL1];
    
    
    OneTipLabItem*item19 = [[OneTipLabItem alloc]init];
    item19.tipArray = strArr;
    [section addItem:item19];
    
    [section addItem:[[FMEmptyItem alloc] initWithHeight:10]];
    
    NSMutableArray *shouArr = [NSMutableArray arrayWithArray:json[@"saleservers"]];
    NSMutableArray *strArr1 = [[NSMutableArray alloc]init];
    for (NSDictionary *dict in shouArr) {
        NSString *str = [NSString stringWithFormat:@"%@ : %@",StrRelay(dict[@"name"]),StrRelay(dict[@"detail"])];
        [strArr1 addObject:str];
    }
    LargeTitleItem *itemL2 = [[LargeTitleItem alloc]init];
    itemL2.titleTxt = @"售后服务";
    itemL2.editProp = ^{
        ChangeSaleViewController *vc = [[ChangeSaleViewController alloc]init];
        vc.propArr = shouArr;
        vc.productId = self.productId;
        vc.saveSuccess = ^{
            [bself getData];
        };
        RootNavPush(vc);
    };
    [section addItem:itemL2];
    
    
    
    OneTipLabItem*item20 = [[OneTipLabItem alloc]init];
    item20.tipArray = strArr1;
    [section addItem:item20];
    
    [section addItem:[[FMEmptyItem alloc] initWithHeight:10]];
    
    LargeTitleItem *itemL3 = [[LargeTitleItem alloc]init];
    itemL3.titleTxt = @"图片详情";
    itemL3.editProp = ^{
        [bself getAllImage];
    };
    [section addItem:itemL3];
    
    
    for (NSDictionary *dict in json[@"imgs"]) {
        OnePictureItem *itemP = [[OnePictureItem alloc]init];
        itemP.urlStr = dict[@"img_url"][@"url"];
        [section addItem:itemP];
    }
    
    
    [self.formManager replaceSectionsWithSectionsFromArray:@[section]];
    [self.formTable reloadData];
}

-(void)shangOrXia:(int)isShow{
    WS(bself);
    NSString *shang = @"0";
    if (isShow == 1) {
        shang = @"0";
    }else{
        shang = @"1";
    }
    NSMutableDictionary *dict = [[NSMutableDictionary alloc]init];
    [dict setObject:self.productId forKey:@"id"];
    [dict setObject:shang forKey:@"isShow"];
    
    [self showLoading];
    [NSObject postDataWithHost:Server_Host Path:ProductChangeStatus Param:dict isCache:NO success:^(id json) {
        
        [bself hiddenLoading];
        Toast(@"修改成功");
        [bself getData];
        
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
        vc.maxCount = 20;
        vc.saveSuceess = ^(NSArray *arr) {
            [bself saveImage:arr];
          
        };
        RootNavPush(vc);
    } fail:^(id json) {
        [bself hiddenLoading];
        Toast(@"请求失败，请稍后重试");
    }];
}

-(void)saveImage:(NSArray *)arr{
    WS(bself);
    NSMutableArray *myArr = [NSMutableArray arrayWithCapacity:0];
    for (int i = 0; i < arr.count; i++) {
        NSMutableDictionary *pDict = [[NSMutableDictionary alloc]init];
        
        NSDictionary *dict = arr[i];
        
        [pDict setObject:dict[@"id"] forKey:@"imgId"];
        [pDict setObject:self.productId forKey:@"productId"];
        [myArr addObject:pDict];
    }
    
    if(myArr.count > 0){
        
        NSError *error = nil;
        
        NSData *jsonData = [NSJSONSerialization dataWithJSONObject:myArr
                                                           options:kNilOptions
                                                             error:&error];
        NSString *jsonString = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
        
        NSMutableDictionary *param = [[NSMutableDictionary alloc]init];
        [param setObject:jsonString forKey:@"image"];
        
        [self showLoading];
        [NSObject postDataWithHost:Server_Host Path:ProductCImage Param:param isCache:NO success:^(id json) {
            
            [bself hiddenLoading];
            Toast(@"修改成功");
            [bself getData];
        } fail:^(id json) {
            [bself hiddenLoading];
        }];
    }else{
        Toast(@"请选择图片");
    }
}
@end
