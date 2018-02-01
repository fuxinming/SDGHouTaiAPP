//
//  myPhotoCell.m
//  photoDemo
//
//  Created by wangxinxu on 2017/6/1.
//  Copyright © 2017年 wangxinxu. All rights reserved.
//

#import "myPhotoCell.h"

@implementation myPhotoCell

-(instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        
        _photoView = [[UIImageView alloc] initWithFrame:self.bounds];
        _photoView.contentMode = UIViewContentModeScaleAspectFill;
        _photoView.layer.masksToBounds = YES;
        [self addSubview:_photoView];
        
        _titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, _photoView.height - 25, _photoView.width, 25)];
        _titleLabel.font = Font_Size_10;
        _titleLabel.backgroundColor = COLOR_999;
        _titleLabel.textColor = COLOR_333;
        _titleLabel.textAlignment = NSTextAlignmentCenter;
        _titleLabel.numberOfLines = 0;
        [self addSubview:_titleLabel];
        
        _signImage = [[UIImageView alloc]initWithFrame:CGRectMake(_photoView.width-22-5, 5, 22, 22)];
        _signImage.layer.cornerRadius = 22/2;
        _signImage.image = WPhoto_btn_UnSelected;
        _signImage.layer.masksToBounds = YES;
        [self addSubview:_signImage];
        
    }
    
    return self;
}

-(void)statusChanged{
    if (self.chooseStatus) {
        _signImage.image = WPhoto_Btn_Selected;
    }else{
        _signImage.image = WPhoto_btn_UnSelected;
    }
}
@end
