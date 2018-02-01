//
//  ChangePropertyViewController.m
//  ShuiDongGou
//
//  Created by cx-fu on 2017/11/6.
//  Copyright © 2017年 付新明. All rights reserved.
//

#import "ChangePropertyViewController.h"
#import "WSMultiTwoEditCell.h"
#import "WSOneBtnCell.h"
@interface ChangePropertyViewController (){
    RETableViewSection *section1;
}

@end

@implementation ChangePropertyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    WS(bself);
    self.navBar.title = @"修改属性";
    self.view.backgroundColor = COLOR_RED_;
    self.navBar.rightItemList = [NSArray arrayWithObject:[FMBarItem itemWith:@"保存" withClick:^(id it) {
        [bself onHandleNextClicked];
    }]];
    
    self.formManager[@"WSMultiTwoEditItem"] = @"WSMultiTwoEditCell";
    self.formManager[@"WSOneBtnItem"] = @"WSOneBtnCell";
    section1 = [RETableViewSection sectionWithHeaderTitle:@""];
    [self initSection1];
    [self initForm];
}
-(void)initSection1{
    
    
    for (int i = 0; i < self.propArr.count; i++ ) {
        
        FMEmptyItem *empty01 = [[FMEmptyItem alloc]initWithHeight:10];
        [section1 addItem:empty01];
        
        NSDictionary *dic = self.propArr[i];
        WSMultiTwoEditItem *itemSecondMem = [[WSMultiTwoEditItem alloc]init];
        itemSecondMem.placeHolderText1 = @"属性Key";
        itemSecondMem.placeHolderText2 = @"属性value";
        itemSecondMem.fieldText1 = StrRelay(dic[@"name"]);
        itemSecondMem.fieldText2 = StrRelay(dic[@"detail"]);
        [section1 addItem:itemSecondMem];
    }
}
- (void)initForm{
    WS(bself);
    NSMutableArray *sectionArray = [NSMutableArray array];
    
    
    RETableViewSection *section2 = [RETableViewSection sectionWithHeaderTitle:@""];
    WSOneBtnItem *btnItem = [[WSOneBtnItem alloc]init];
    btnItem.titleText  = @"+";
    btnItem.titleFont = FMFontSys(30);
    btnItem.btnPress = ^{
        [bself addItem];
    };
    btnItem.btnRect = CGRectMake((SCREEN_WIDTH - 60)/2, 0, 60, 60);
    [section2 addItem:btnItem];
    
    [sectionArray addObject:section1];
    [sectionArray addObject:section2];
    [self.formManager replaceSectionsWithSectionsFromArray:sectionArray];
    [self.formTable reloadData];
    
}

-(void)addItem{
    FMEmptyItem *empty05 = [[FMEmptyItem alloc]initWithHeight:10];
    [section1 addItem:empty05];
    
    WSMultiTwoEditItem *itemSecondMem = [[WSMultiTwoEditItem alloc]init];
    itemSecondMem.placeHolderText1 = @"属性Key";
    itemSecondMem.placeHolderText2 = @"属性value";
    
    [section1 addItem:itemSecondMem];

    
    [self initForm];
}

-(void)onHandleNextClicked{
     WS(bself);
    NSMutableArray *arr = [NSMutableArray arrayWithCapacity:0];
    for (int i = 0 ; i < section1.items.count; i ++) {
        NSMutableDictionary *dict = [[NSMutableDictionary alloc]init];
        id item = section1.items[i];
        if ([item isKindOfClass:[WSMultiTwoEditItem class]]) {
            WSMultiTwoEditItem *tempItem = item;
            if (!ISEmptyStr(tempItem.fieldText1) && !ISEmptyStr(tempItem.fieldText2)) {
                [dict setObject:tempItem.fieldText1 forKey:@"name"];
                [dict setObject:tempItem.fieldText2 forKey:@"detail"];
                [dict setObject:self.productId forKey:@"productId"];
                [arr addObject:dict];
            }
        }
    }
    
    if(arr.count > 0){
        NSError *error = nil;
        
        NSData *jsonData = [NSJSONSerialization dataWithJSONObject:arr
                                                           options:kNilOptions
                                                             error:&error];
        NSString *jsonString = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
        
        NSMutableDictionary *dict = [[NSMutableDictionary alloc]init];
        [dict setObject:jsonString forKey:@"property"];
        
        [self showLoading];
        [NSObject postDataWithHost:Server_Host Path:ProductProperty Param:dict isCache:NO success:^(id json) {
            
            [bself hiddenLoading];
            Toast(@"修改成功");
            RootNavPop(YES);
            FMBlock(bself.saveSuccess);
        } fail:^(id json) {
            [bself hiddenLoading];
        }];
    }else{
        Toast(@"请填写相应值");
    }
    
    
    
    
}

@end
