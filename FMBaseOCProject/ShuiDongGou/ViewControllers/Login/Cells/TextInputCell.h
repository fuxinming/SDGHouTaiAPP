//
//  FMFormTextCell.h
//  OMengMerchant
//
//  Created by fuxinming on 14-5-9.
//  Copyright (c) 2014年 fuxinming. All rights reserved.
//

#import "RETableViewCell.h"
#import "RETableViewItem.h"

@interface TextInputItem : RETableViewItem
@property (nonatomic,copy) NSString *titleText;
@property (nonatomic,copy) NSString *textValue;
@property (nonatomic,copy) NSString *placeholder;
@property (nonatomic,assign)UIKeyboardType keyboardType;
@property (nonatomic,assign) BOOL hasLine;
@property (nonatomic,assign) BOOL isSecret;
@property (nonatomic,assign) int maxLength;

@end

@interface TextInputCell : RETableViewCell
@property (strong, readwrite, nonatomic) TextInputItem *item;
@property (nonatomic,strong) UITextField *textField;
@end
