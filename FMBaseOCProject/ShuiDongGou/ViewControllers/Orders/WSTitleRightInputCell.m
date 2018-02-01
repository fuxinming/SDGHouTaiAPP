//
//  WSTitleTextCell.m
//  SunnyCar
//
//  Created by jienliang on 2017/1/12.
//  Copyright © 2017年 jienliang. All rights reserved.
//

#import "WSTitleRightInputCell.h"

@implementation WSTitleRightInputItem
- (instancetype)init;
{
    if (self= [super init]) {
        self.cellHeight = 48;
        self.hasLine = YES;
        self.rightTextColor = COLOR_RED_;
        self.maxLenth = 1000;
        self.keyboardType = UIKeyboardTypeDefault;
    }
    return self;
}
@end

@interface WSTitleRightInputCell ()<UITextFieldDelegate>
{
    UILabel *titleLab;
    UITextField *rightTxtField;
    UIView *lineImg;
}
@end
@implementation WSTitleRightInputCell
@dynamic item;
- (void)cellDidLoad
{
    [super cellDidLoad];
    self.backgroundColor = Color_Clear;
    
    rightTxtField = [[UITextField alloc] initWithFrame:CGRectMake(18,24,SCREEN_WIDTH - 36, 22)];
    rightTxtField.font = Font_Size_16;
    rightTxtField.delegate = self;
    rightTxtField.textColor = COLOR_RED_;
    rightTxtField.returnKeyType = UIReturnKeyDone;
    rightTxtField.textAlignment = NSTextAlignmentCenter;
    [rightTxtField addTarget:self action:@selector(textFieldDidChange:) forControlEvents:UIControlEventEditingChanged];
    
    [self.contentView addSubview:rightTxtField];
 
    lineImg =[[UIView alloc] initWithFrame:CGRectMake(18, 67.5, SCREEN_WIDTH-18 - 18, 0.5)];
    lineImg.backgroundColor = COLOR_RED_;
    [self.contentView addSubview:lineImg];
}

- (void)setHighlighted:(BOOL)highlighted animated:(BOOL)animated{}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated{}
- (void)layoutSubviews
{
    [super layoutSubviews];
}

- (void)cellWillAppear
{
    [super cellWillAppear];
    lineImg.hidden = !self.item.hasLine;
    lineImg.frame = CGRectMake(18, self.item.cellHeight  - 0.5, SCREEN_WIDTH-18 - 18, 0.5);
    titleLab.text = [CommonUtil strRelay:self.item.titleText];
    rightTxtField.text = [CommonUtil strRelay:self.item.rightText];
    [titleLab sizeToFit];
    titleLab.frame = CGRectMake(28, 36, titleLab.width, 22);
    NSMutableDictionary *attrs = [NSMutableDictionary dictionary]; // 创建属性字典
    attrs[NSFontAttributeName] = Font_Size_16; // 设置font
    attrs[NSForegroundColorAttributeName] = self.item.rightTextColor; // 设置颜色
    NSAttributedString *attStr = [[NSAttributedString alloc] initWithString:self.item.rightPlaceText attributes:attrs]; // 初始化富文本占位字符串
    rightTxtField.attributedPlaceholder = attStr;
    
    rightTxtField.keyboardType = self.item.keyboardType;

}

-(void)textFieldDidChange:(UITextField *)textV {
    
    [WJAppUtil checkTextField:textV maxLen:self.item.maxLenth];
    self.item.rightText = textV.text;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];
    return YES;
};

@end
