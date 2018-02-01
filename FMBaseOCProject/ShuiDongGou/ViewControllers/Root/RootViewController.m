//
//  RootViewController.m
//  ShuiDongGou
//
//  Created by q on 2017/10/20.
//  Copyright © 2017年 付新明. All rights reserved.
//

#import "RootViewController.h"
#import "LoginViewController.h"
#import "OrdersViewController.h"
#import "ProductViewController.h"
#import "UploadPicViewController.h"
@interface RootViewController ()
@property (nonatomic,copy) NSString *token;
@property (nonatomic,copy) NSString *scope;
@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = COLOR_LIGHTGRAY;
    
    UIImage *bgImage = [QuickBuild quickBuildimageWithColor:Random_Color];
    UIButton *orderBtn = [QuickBuild quickBuildButtonWithFrame:CGRectMake(50, 50, SCREEN_WIDTH - 100, 100) title:@"订单" color:Random_Color font:Font_Size_36 backgroundImage:bgImage target:self action:@selector(orderBtnClick)];
    View_Border_Radius(orderBtn, 8, 0, Color_Clear);
    [self.view addSubview:orderBtn];
    
    UIImage *bgImage1 = [QuickBuild quickBuildimageWithColor:Random_Color];
    UIButton *productBtn = [QuickBuild quickBuildButtonWithFrame:CGRectMake(50, orderBtn.bottom+50, SCREEN_WIDTH - 100, 100) title:@"商品" color:Random_Color font:Font_Size_36 backgroundImage:bgImage1 target:self action:@selector(productBtnClick)];
    View_Border_Radius(productBtn, 8, 0, Color_Clear);
    [self.view addSubview:productBtn];
    
    UIImage *bgImage2 = [QuickBuild quickBuildimageWithColor:Random_Color];
    UIButton *imageBtn = [QuickBuild quickBuildButtonWithFrame:CGRectMake(50, productBtn.bottom+50, SCREEN_WIDTH - 100, 100) title:@"上传图片" color:Random_Color font:Font_Size_36 backgroundImage:bgImage2 target:self action:@selector(imageBtnClick)];
    View_Border_Radius(imageBtn, 8, 0, Color_Clear);
    [self.view addSubview:imageBtn];
}

-(void)orderBtnClick{
    if(ISEmptyStr(self.token)){
        [self login];
    }else{
        OrdersViewController *vc = [[OrdersViewController alloc]init];
        RootNavPush(vc);
    }
    

}

-(void)productBtnClick{
    if(ISEmptyStr(self.token)){
        [self login];
    }else{
        
        if ([self.scope intValue] <32) {
            Toast(@"没有权限");
        }else{
            ProductViewController *vc = [[ProductViewController alloc]init];
            RootNavPush(vc);
        }
        
    }
}

-(void)imageBtnClick{
    if(ISEmptyStr(self.token)){
        [self login];
    }else{
        
        if ([self.scope intValue] <32) {
            Toast(@"没有权限");
        }else{
            UploadPicViewController *vc = [[UploadPicViewController alloc]init];
            RootNavPush(vc);
        }
        
    }
    
    
}

-(void)login{
    WS(bself);
    LoginViewController *vc = [[LoginViewController alloc]init];
    vc.loginSucc = ^(NSString *token, NSString *scope) {
        bself.token = token;
        bself.scope = scope;
    };
    RootNavPush(vc);
}
@end
