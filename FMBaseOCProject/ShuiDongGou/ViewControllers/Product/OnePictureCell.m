//
//  FDHouseInfoCell.m
//  SunnyCar
//
//  Created by q on 2017/9/22.
//  Copyright © 2017年 jienliang. All rights reserved.
//

#import "OnePictureCell.h"

@implementation OnePictureItem
- (instancetype)init
{
    self = [super init];
    if (self) {
       
        self.cellHeight =  200;
    }
    return self;
}
@end

@interface OnePictureCell ()
{
   UIImageView *iconImage;
}
@end

@implementation OnePictureCell
@dynamic item;

- (void)cellDidLoad
{
    [super cellDidLoad];
    self.backgroundColor = [UIColor whiteColor];
   iconImage = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 200)];
   
   [self.contentView addSubview:iconImage];
   
}

- (void)setHighlighted:(BOOL)highlighted animated:(BOOL)animated{}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated{}
- (void)layoutSubviews
{
    [super layoutSubviews];
   self.height = self.item.cellHeight;
   iconImage.frame = CGRectMake(0, 0, SCREEN_WIDTH, self.item.cellHeight);
//   [iconImage sd_setImageWithURL:[NSURL URLWithString:StrRelay(self.item.urlStr)]];
   
}

- (void)cellWillAppear
{
    [super cellWillAppear];
   WS(bself);
   UIImage *img = [[SDWebImageManager sharedManager].imageCache imageFromDiskCacheForKey:self.item.urlStr];
   if(img) {
      [self jisuanHeight:img];
   }
   else {
      WS(bself);
      [[SDWebImageManager sharedManager].imageDownloader downloadImageWithURL:[NSURL URLWithString:self.item.urlStr] options:SDWebImageDownloaderContinueInBackground progress:^(NSInteger receivedSize, NSInteger expectedSize, NSURL * _Nullable targetURL) {
      } completed:^(UIImage * _Nullable image, NSData * _Nullable data, NSError * _Nullable error, BOOL finished) {
         [[SDImageCache sharedImageCache] storeImageDataToDisk:data forKey:bself.item.urlStr];
         [bself jisuanHeight:image];
      }];
   }
}

- (void)jisuanHeight:(UIImage *)img {
   if (img) {
      [iconImage setImage:img];
      float width = SCREEN_WIDTH;
      float height = (width * img.size.height)/img.size.width;
      self.item.cellHeight = height;
      self.height = self.item.cellHeight;
      iconImage.height = self.item.cellHeight;
   }
   [self setNeedsLayout];
}

@end
