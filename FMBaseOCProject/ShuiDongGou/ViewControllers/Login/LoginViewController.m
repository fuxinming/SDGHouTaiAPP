//
//  LoginViewController.m
//  FMBaseProject
//
//  Created by shanjin on 2016/11/5.
//  Copyright © 2016年 付新明. All rights reserved.
//

#import "LoginViewController.h"

#import "TextInputCell.h"
#import "WSLoginBtnCell.h"


@interface LoginViewController (){
    UIImageView *bgView;
    TextInputItem *userItem1;
    TextInputItem *passItem;
    
}

@end

@implementation LoginViewController
- (void)viewDidLoad
{
    [super viewDidLoad];
    self.navBar.title = @"登录";
    bgView=[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    bgView.image=[UIImage imageNamed:@"bg4"];
    [self.backGroundView addSubview:bgView];
    self.formManager[@"TextInputItem"] = @"TextInputCell";
    self.formManager[@"WSLoginBtnItem"] = @"WSLoginBtnCell";

    
    [self initForm];
//    WS(bself);
//    self.navBar.rightItemList = [NSArray arrayWithObject:[FMBarItem itemWith:@"注册" withClick:^(id it) {
//    }]];
}
- (void)initForm{
    WS(bself);
    NSMutableArray *sectionArray = [NSMutableArray array];
    RETableViewSection *section0 = [RETableViewSection sectionWithHeaderTitle:@""];
    
    
    FMEmptyItem *empty = [[FMEmptyItem alloc]initWithHeight:100];
    [section0 addItem:empty];
    
    userItem1 = [[TextInputItem alloc]init];
    userItem1.titleText = @"用户名";
    userItem1.placeholder = @"请输入用户名";
    userItem1.maxLength = 30;
    [section0 addItem:userItem1];
    
    passItem = [[TextInputItem alloc]init];
    passItem.titleText = @"密码";
    passItem.placeholder = @"请输入密码";
    passItem.maxLength = 32;
    passItem.isSecret = YES;
    passItem.keyboardType = UIKeyboardTypeAlphabet;
    [section0 addItem:passItem];
    
    
    [section0 addItem:[[FMEmptyItem alloc] initWithHeight:40]];
    
    
    WSLoginBtnItem *loginItem = [[WSLoginBtnItem alloc] init];
    loginItem.titleText = @"登录";
    loginItem.borderColor = [UIColor clearColor];
    loginItem.bgColor = [UIColor clearColor];
    loginItem.isHasCorner = YES;
    loginItem.borderColor = COLOR_RED_;

    loginItem.btnPress = ^(void){
        [bself.view endEditing:YES];
        [bself landClick];
    };
    [section0 addItem:loginItem];
    
    
    [sectionArray addObject:section0];
    [self.formManager replaceSectionsWithSectionsFromArray:sectionArray];
    [self.formTable reloadData];
    
}


//登录
-(void)landClick
{
    WS(bself);
    if (ISEmptyStr(userItem1.textValue)) {
        Toast(@"请输入用户名");
        return;
    }
    if (ISEmptyStr(passItem.textValue)) {
        Toast(@"请输入密码");
        return;
    }
    
    NSMutableDictionary *dict = [[NSMutableDictionary alloc]init];
    [dict setObject:userItem1.textValue forKey:@"ac"];
    [dict setObject:passItem.textValue forKey:@"se"];
    
    [self showLoading];
    [NSObject postDataWithHost:Server_Host Path:TokenAppNew Param:dict isCache:NO success:^(id json) {
        
        [bself hiddenLoading];
        if (!ISEmptyStr(json[@"uid"]) ) {
            Toast(@"登录成功");
            if (self.loginSucc) {
                self.loginSucc(json[@"uid"], json[@"scope"]);
            }
            RootNavPop(YES);
            
        }else{
            Toast(@"登录失败");
        }
        
    } fail:^(id json) {
        [bself hiddenLoading];
    }];
}
@end
