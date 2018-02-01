//
//  FMFormViewController.m
//  FMBaseProject
//
//  Created by shanjin on 2016/10/25.
//  Copyright © 2016年 付新明. All rights reserved.
//

#import "FMFormViewController.h"

@interface FMFormViewController ()

@end

@implementation FMFormViewController
@synthesize sectionArray;
@synthesize section0;
- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initView];
}
- (void)initView
{
    _formTable = [[TPKeyboardAvoidingTableView alloc] initWithFrame:CGRectMake(0, NavigationBarH, SCREEN_WIDTH, SCREEN_HEIGHT - NavigationBarH) style:UITableViewStylePlain];
    _formTable.showsVerticalScrollIndicator = NO;
    _formTable.separatorStyle = UITableViewCellSeparatorStyleNone;
    _formTable.backgroundColor = [UIColor clearColor];
    _formTable.estimatedRowHeight = 0;
    _formTable.estimatedSectionHeaderHeight = 0;
    _formTable.estimatedSectionFooterHeight = 0;
#ifdef __IPHONE_11_0
    if ([_formTable respondsToSelector:@selector(setContentInsetAdjustmentBehavior:)]) {
        _formTable.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
    }
#endif
    [self.view addSubview:_formTable];
    
    _formManager = [[RETableViewManager alloc] initWithTableView:_formTable];
    _formManager.delegate = self;
    _formManager[@"FMEmptyItem"] = @"FMEmptyCell";
    
}
#pragma mark - RETableViewManagerDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)sectionIndex{
    return 0;
}

- (void)addHeader {
    WS(bself);
    self.formTable.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [bself performSelector:@selector(getData) withObject:nil afterDelay:0.001];
    }];
}

- (void)beginRefrash {
    [self.formTable.mj_header beginRefreshing];
}

- (void)endRefrash {
    [self.formTable.mj_header endRefreshing];
}

-(void)getData{}

@end
