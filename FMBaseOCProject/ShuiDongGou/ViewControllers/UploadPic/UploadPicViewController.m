//
//  ProductViewController.m
//  ShuiDongGou
//
//  Created by q on 2017/10/24.
//  Copyright © 2017年 付新明. All rights reserved.
//

#import "UploadPicViewController.h"
#import "WSTitleRightInputCell.h"
#import "ChoosePictureCell.h"
@interface UploadPicViewController (){
    WSTitleRightInputItem *itemP1;
    ChoosePictureItem *choose;
}

@end

@implementation UploadPicViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navBar.title = @"上传图片";
    self.formManager[@"WSTitleRightInputItem"] = @"WSTitleRightInputCell";
    self.formManager[@"ChoosePictureItem"] = @"ChoosePictureCell";
    WS(bself);
    self.navBar.rightItemList = [NSArray arrayWithObject:[FMBarItem itemWith:@"上传" withClick:^(id it) {
        [bself shangchuan];
    }]];
    [self initForm];
    
}

- (void)initForm
{
    
    WS(bself);
    RETableViewSection *section = [RETableViewSection sectionWithHeaderTitle:@""];
    
    [section addItem:[[FMEmptyItem alloc] initWithHeight:17]];
    
    itemP1= [[WSTitleRightInputItem alloc]init];
    itemP1.rightPlaceText = @"输入图片名称";
    itemP1.maxLenth = 30;
    [section addItem:itemP1];
    
    [section addItem:[[FMEmptyItem alloc] initWithHeight:17]];
    
    choose = [[ChoosePictureItem alloc]init];
    choose.parentV = self;
    [section addItem:choose];
    
    [self.formManager replaceSectionsWithSectionsFromArray:@[section]];
    [self.formTable reloadData];
}


-(void)shangchuan{
    WS(bself);
    if(ISEmptyStr(itemP1.rightText )||ISEmptyStr(choose.filePath)) {
        Toast(@"请输入图片名称或者选择图片");
        return;
    }
    NSMutableDictionary *param = [[NSMutableDictionary alloc]init];
    [param setObject:itemP1.rightText forKey:@"fileName"];
    
    NSMutableArray *fileArray = [NSMutableArray arrayWithCapacity:0];
    NSMutableDictionary *imageDict = [[NSMutableDictionary alloc]init];
    [imageDict setObject:choose.filePath forKey:@"image"];
    [fileArray addObject:imageDict];
    [self showLoading];
    [NSObject uploadPic:Server_Host path:ProductUploadImage param:param files:fileArray success:^(id json) {
        [bself hiddenLoading];
        Toast(json[@"msg"]);
    } fail:^(id json) {
        [bself hiddenLoading];
        Toast(@"上传失败");
    }];
    
}
@end
