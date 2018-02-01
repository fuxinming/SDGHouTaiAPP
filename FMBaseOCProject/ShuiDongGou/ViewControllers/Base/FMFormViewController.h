//
//  FMFormViewController.h
//  FMBaseProject
//
//  Created by shanjin on 2016/10/25.
//  Copyright © 2016年 付新明. All rights reserved.
//

#import "BaseViewController.h"
#import "RETableViewManager.h"
#import "FMEmptyCell.h"
#import "TPKeyboardAvoidingTableView.h"
@interface FMFormViewController : BaseViewController<RETableViewManagerDelegate>
@property (nonatomic, strong) RETableViewManager *formManager;  //表单管理器
@property (nonatomic, strong) TPKeyboardAvoidingTableView *formTable;           //表单表格
@property (nonatomic, assign) BOOL hasHeadRefresh;              //是否具有上拉刷新

@property (nonatomic, strong) NSMutableArray *sectionArray;
@property (nonatomic, strong) RETableViewSection *section0;
- (void)addHeader;
- (void)beginRefrash;
- (void)endRefrash;
@end
