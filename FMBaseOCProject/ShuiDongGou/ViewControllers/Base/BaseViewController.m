//
//  BaseViewController.m
//  ShuiDongGou
//
//  Created by q on 2017/10/20.
//  Copyright © 2017年 付新明. All rights reserved.
//

#import "BaseViewController.h"
#import "MBProgressHUD.h"
@interface BaseViewController ()

@end

@implementation BaseViewController
@synthesize navHidden = _navHidden;
- (id)init{
    self = [super init];
    if (self) {
        // Custom initialization
        _navHidden = NO;
        self.hiddenBack = NO;
    }
    return self;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBarHidden = YES;
    if ([self respondsToSelector:@selector(setAutomaticallyAdjustsScrollViewInsets:)]){
        self.automaticallyAdjustsScrollViewInsets = NO;
    }
    self.backGroundView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
    [self.view addSubview:self.backGroundView];
    [self initNav];
    [self.view setBackgroundColor:COLOR_LIGHTGRAY];
}
-(void)vcPop{
    RootNavPop(YES);
}

#pragma mark - Private
- (void)initNav{
    WS(bself);
    if (!self.navHidden) {
        _navBar = [[FMNavBar alloc] init];
        if (bself.navigationController){
            NSArray *array = bself.navigationController.viewControllers;
            if ([array count] > 0) {
                id rootVC = [self.navigationController.viewControllers objectAtIndex:0];
                id topVC = self.navigationController.topViewController;
                if (self != rootVC && self == topVC && !self.hiddenBack) {
                    _navBar.leftItemList = [NSArray arrayWithObject:[FMBarItem itemImg:@"back" withClick:^(id it) {
                        [bself vcPop];
                    }]];
                }
            }
        }
        [self.view addSubview:_navBar];
    }
}


- (void)popToViewController:(NSString *)cls{
    NSMutableArray *ar = [[NSMutableArray alloc] init];
    for (int i = 0; i < [self.navigationController.viewControllers count]; i++) {
        id ttt = [self.navigationController.viewControllers objectAtIndex:i];
        [ar addObject:ttt];
        if ([ttt isKindOfClass:[NSClassFromString(cls) class]]) {
            break;
        }
    }
    [self.navigationController setViewControllers:ar animated:YES];
}

#pragma mark - Private
- (void)hiddenLoading {
    [MBProgressHUD hideHUDForView:Window animated:YES];
}

- (void)showLoading {
    [MBProgressHUD showHUDAddedTo:Window animated:YES];
}
@end
