//
//  FDHouseInfoCell.m
//  SunnyCar
//
//  Created by q on 2017/9/22.
//  Copyright © 2017年 jienliang. All rights reserved.
//

#import "ChoosePictureCell.h"
#import "WJImagePicker.h"


@implementation ChoosePictureItem
- (instancetype)init
{
    self = [super init];
    if (self) {
       
        self.cellHeight = (SCREEN_WIDTH - 40);
    }
    return self;
}
@end

@interface ChoosePictureCell ()<UIActionSheetDelegate,WJImagePickerDelegate>
{
   UIButton *btn;
}
@end

@implementation ChoosePictureCell
@dynamic item;

- (void)cellDidLoad
{
    [super cellDidLoad];
    self.backgroundColor = [UIColor clearColor];
    btn = [[UIButton alloc] initWithFrame:CGRectMake(20, 0, SCREEN_WIDTH - 40, SCREEN_WIDTH - 40)];
    [btn setImage:[UIImage imageNamed:@"vd_ico_home_add_n@3x"] forState:UIControlStateNormal];
    btn.backgroundColor = [UIColor whiteColor];
    [btn addTarget:self action:@selector(btnPress:) forControlEvents:UIControlEventTouchUpInside];
    [self.contentView addSubview:btn];
   
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
    [btn setBackgroundImage:[UIImage imageNamed:@"vd_ico_home_add_n"] forState:UIControlStateNormal];
    if (![CommonUtil strNilOrEmpty:self.item.filePath]) {
        [btn setBackgroundImage:[UIImage imageWithContentsOfFile:self.item.filePath] forState:UIControlStateNormal];
    }
}

- (void)btnPress:(UIButton *)btn {
    UIActionSheet *actionSheet = [[UIActionSheet alloc] initWithTitle:nil delegate:self cancelButtonTitle:@"取消" destructiveButtonTitle:nil otherButtonTitles:@"从相册中选取", @"拍照", nil];
    actionSheet.actionSheetStyle = UIActionSheetStyleBlackOpaque;
    [actionSheet showInView:self.item.parentV.view];
   
}
- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex {
    if (buttonIndex==0||buttonIndex==1) {
        int type = 0;
        if (buttonIndex==0) {
            type = 1;
        }
        //单例工具
        WJImagePicker *imagePicker = [WJImagePicker sharedInstance];
        imagePicker.delegate = self;
        //设置宽高比scale来设置剪切框大小，剪切框宽度固定为屏幕宽度
//        [imagePicker showImagePickerWithType:type   InViewController:self.item.parentV Scale:0.75];
        [imagePicker showOriginalImagePickerWithType:type InViewController:self.item.parentV];
    }
}

- (void)imagePicker:(WJImagePicker *)imagePicker     didFinished:(UIImage *)editedImage {
    NSString *filePath = [FMFile fileCacheDir:[NSString stringWithFormat:@"%@.png",[CommonUtil strGUID]]];
    NSData *imagedata=UIImagePNGRepresentation(editedImage);
    [imagedata writeToFile:filePath atomically:YES];
    
    [btn setBackgroundImage:editedImage forState:UIControlStateNormal];
    self.item.filePath = filePath;
}
@end
