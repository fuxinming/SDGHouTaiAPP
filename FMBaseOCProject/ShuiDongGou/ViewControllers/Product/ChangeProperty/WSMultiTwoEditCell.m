//
//  WSTitleTextCell.m
//  SunnyCar
//
//  Created by jienliang on 2017/1/12.
//  Copyright © 2017年 jienliang. All rights reserved.
//

#import "WSMultiTwoEditCell.h"

@implementation WSMultiTwoEditItem
- (instancetype)init
{
    self = [super init];
    if (self) {
        self.cellHeight = 45;
        self.font = FMFontSys(15);
        self.maxLen = INT_MAX;
        self.keyboardType = UIKeyboardTypeDefault;
        self.textAlignment = NSTextAlignmentLeft;
    }
    return self;
}
@end

@interface WSMultiTwoEditCell ()<UITextFieldDelegate>
{
    UIView *bgView1;
    UIView *bgView2;

    UITextField *textField1;
    UITextField *textField2;
}
@end
@implementation WSMultiTwoEditCell
@dynamic item;
- (void)cellDidLoad
{
    [super cellDidLoad];
    self.backgroundColor = [UIColor clearColor];
    self.contentView.backgroundColor = [UIColor clearColor];
    
    float width = (SCREEN_WIDTH - 10 - 24)/2;
    bgView1 = [[UIView alloc]initWithFrame:CGRectMake(12, 0, width, 45)];
    bgView1.backgroundColor = [UIColor whiteColor];
    bgView1.alpha = 0.4;
    bgView1.layer.cornerRadius = 8;
    [self.contentView addSubview:bgView1];
    
    bgView2 = [[UIView alloc]initWithFrame:CGRectMake(bgView1.right + 10, 0, width, 45)];
    bgView2.backgroundColor = [UIColor whiteColor];
    bgView2.alpha = 0.4;
    bgView2.layer.cornerRadius = 8;
    [self.contentView addSubview:bgView2];
    
    textField1 = [[UITextField alloc] initWithFrame:CGRectMake(20, 2, width-16, 41)];
    
    textField1.delegate = self;
    textField1.textColor = [UIColor whiteColor];
    [textField1 addTarget:self action:@selector(textFieldDidChange:) forControlEvents:UIControlEventEditingChanged];
    
    [self.contentView addSubview:textField1];
    
    textField2 = [[UITextField alloc] initWithFrame:CGRectMake(bgView2.left +8, 2, width-16, 41)];
    
    textField2.delegate = self;
    textField2.textColor = [UIColor whiteColor];
    [textField2 addTarget:self action:@selector(textFieldDidChange:) forControlEvents:UIControlEventEditingChanged];
    
    [self.contentView addSubview:textField2];
    
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
    textField1.textAlignment = self.item.textAlignment;
    textField2.textAlignment = self.item.textAlignment;
    
    textField1.text = [CommonUtil strRelay:self.item.fieldText1];
    textField2.text = [CommonUtil strRelay:self.item.fieldText2];
    
    
    NSMutableAttributedString *placeholder1 = [[NSMutableAttributedString alloc] initWithString:[CommonUtil strRelay:self.item.placeHolderText1]];
    [placeholder1 addAttribute:NSForegroundColorAttributeName
                        value:[UIColor whiteColor]
                        range:NSMakeRange(0, [CommonUtil strRelay:self.item.placeHolderText1].length)];
    [placeholder1 addAttribute:NSFontAttributeName
                        value:[UIFont boldSystemFontOfSize:14]
                        range:NSMakeRange(0, [CommonUtil strRelay:self.item.placeHolderText1].length)];
    textField1.attributedPlaceholder = placeholder1;
    
    
    NSMutableAttributedString *placeholder2 = [[NSMutableAttributedString alloc] initWithString:[CommonUtil strRelay:self.item.placeHolderText2]];
    [placeholder2 addAttribute:NSForegroundColorAttributeName
                         value:[UIColor whiteColor]
                         range:NSMakeRange(0, [CommonUtil strRelay:self.item.placeHolderText2].length)];
    [placeholder2 addAttribute:NSFontAttributeName
                         value:[UIFont boldSystemFontOfSize:14]
                         range:NSMakeRange(0, [CommonUtil strRelay:self.item.placeHolderText2].length)];
    textField2.attributedPlaceholder = placeholder2;
    
}

-(void)textFieldDidChange:(UITextField *)textV {
    [CommonUtil checkTextField:textV maxLen:self.item.maxLen];
    if (textV == textField1) {
        self.item.fieldText1 = textV.text;
    }
    if (textV == textField2) {
        self.item.fieldText2 = textV.text;
    }
    
    
}
@end
