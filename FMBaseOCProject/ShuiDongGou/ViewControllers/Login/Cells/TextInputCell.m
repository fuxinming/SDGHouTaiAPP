//
//  FMFormTextCell.m
//  OMengMerchant
//
//  Created by fuxinming on 14-5-9.
//  Copyright (c) 2014年 fuxinming. All rights reserved.
//

#import "TextInputCell.h"

@implementation TextInputItem
- (id)init{
    if (self = [super init]) {
        self.cellHeight = 50;
        self.hasLine = YES;
        self.maxLength = 11;
        self.isSecret = NO;
        self.keyboardType = UIKeyboardTypeDefault;
    }
    return self;
}


@end

@interface TextInputCell()
{
    UILabel * titleLab;
    UIView *lineImg;
}
@end

@implementation TextInputCell
@dynamic item;
- (void)cellDidLoad
{
    [super cellDidLoad];
    WS(bself);
    self.backgroundColor = [UIColor clearColor];
    self.contentView.backgroundColor = [UIColor clearColor];
    
    titleLab = [[UILabel alloc] initWithFrame:CGRectMake(25, 20, 80, 20)];
    titleLab.font = FMFontSys(15);
    titleLab.textColor = [UIColor whiteColor];
    [self.contentView addSubview:titleLab];
    
    _textField = [[UITextField alloc]initWithFrame:CGRectMake(titleLab.right + 10, 20, SCREEN_WIDTH - 140, 20)];
    _textField.returnKeyType = UIReturnKeyDone;
    _textField.textColor = [UIColor whiteColor];
    _textField.font = FMFontSys(15);
    _textField.keyboardType = UIKeyboardTypeDefault;
    [_textField addTarget:self action:@selector(textFieldDidChange:) forControlEvents:UIControlEventEditingChanged];
    [self.contentView addSubview:_textField];

    
    lineImg = [[UIView alloc]initWithFrame:CGRectMake(25, 49.5, SCREEN_WIDTH - 50, 1)];
    lineImg.backgroundColor = COLOR_RED_;
    [self.contentView addSubview:lineImg];
   
}

- (void)setHighlighted:(BOOL)highlighted animated:(BOOL)animated{}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated{}

- (void)cellWillAppear
{
    [super cellWillAppear];
    lineImg.hidden = !self.item.hasLine;
    _textField.placeholder = StrRelay(self.item.placeholder);
    _textField.text = self.item.textValue;
    _textField.keyboardType = self.item.keyboardType;
    titleLab.text = self.item.titleText;
    if (self.item.isSecret) {
        _textField.secureTextEntry = YES;
    }
}

- (void)layoutSubviews
{
    [super layoutSubviews];

}

-(void)textFieldDidChange:(UITextField *)textV {
    [WJAppUtil checkTextField:_textField maxLen:self.item.maxLength];
    self.item.textValue = textV.text;
}

@end
