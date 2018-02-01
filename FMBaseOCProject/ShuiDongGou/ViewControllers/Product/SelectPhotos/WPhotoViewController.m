//
//  WPhotoViewController.m
//  SunnyCar
//
//  Created by q on 2017/7/21.
//  Copyright © 2017年 jienliang. All rights reserved.
//

#import "WPhotoViewController.h"
#import "FMNavBar.h"
@interface WPhotoViewController ()<UICollectionViewDelegate, UICollectionViewDataSource>{

}
//显示照片
@property (nonatomic, strong) UICollectionView *ado_collectionView;

//所选择的图片数组
@property (nonatomic, strong) NSMutableArray *chooseArray;
//所选择的图片所在cell的序列号数组
@property (nonatomic, strong) NSMutableArray *chooseCellArray;

@end

@implementation WPhotoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor blackColor];
    WS(bself);
    
    FMBarItem *rightItem = [[FMBarItem alloc] init];
    rightItem.itemStyle = 0;
    rightItem.itemTitle = @"确定";
    rightItem.onClick = ^(id item) {
        [bself toShare];
    };
    self.navBar.rightItemList = [NSArray arrayWithObject:rightItem];
    self.navBar.title = @"选择图片";
    [self.view addSubview:[self ado_collectionView]];
    
    [self registerPhotoCell];
}

- (UIImage *)compressImage:(UIImage *)image toMaxFileSize:(NSInteger)maxFileSize {
    CGFloat compression = 0.9f;
    CGFloat maxCompression = 0.1f;
    NSData *imageData = UIImageJPEGRepresentation(image, compression);
    while ([imageData length] > maxFileSize && compression > maxCompression) {
        compression -= 0.1;
        imageData = UIImageJPEGRepresentation(image, compression);
    }
    
    UIImage *compressedImage = [UIImage imageWithData:imageData];
    return compressedImage;
}

- (UIImage *)imageWithImage:(UIImage*)image
              scaledToSize:(CGSize)newSize;
{
    UIGraphicsBeginImageContext(newSize);
    [image drawInRect:CGRectMake(0,0,newSize.width,newSize.height)];
    UIImage* newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newImage;
}

- (void)toShare {
    if (self.chooseArray.count==0) {
        Toast(@"请选择至少一张图片");
        return;
    }
    
    if (self.chooseArray.count>self.maxCount) {
        NSString *str = [NSString stringWithFormat:@"最多选择%d张",self.maxCount];
        Toast(str);
        return;
    }
    
    if (self.saveSuceess) {
        self.saveSuceess(self.chooseArray);
    }
    
    RootNavPop(YES);

}

-(void)registerPhotoCell{
    for (NSInteger i = 0; i < _allPhotoArr.count; i++) {
        NSString *cellId = [NSString stringWithFormat:@"cell%ld", (long)i];
        [self.ado_collectionView registerClass:[myPhotoCell class] forCellWithReuseIdentifier:cellId];
    }
    [self.ado_collectionView reloadData];
}

#pragma mark Collection
-(UICollectionView *)ado_collectionView
{
    if (!_ado_collectionView) {
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
        [layout setItemSize:CGSizeMake((SCREEN_WIDTH-60)/3, (SCREEN_WIDTH-60)/3)];
        [layout setScrollDirection:UICollectionViewScrollDirectionVertical];
        layout.sectionInset = UIEdgeInsetsMake(15, 15, 15, 15);
        
        _ado_collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 64, SCREEN_WIDTH, SCREEN_HEIGHT - 64) collectionViewLayout:layout];
        _ado_collectionView.backgroundColor = [UIColor whiteColor];
        _ado_collectionView.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
        _ado_collectionView.dataSource = self;
        _ado_collectionView.delegate = self;
        
        [self.ado_collectionView registerClass:[myPhotoCell class] forCellWithReuseIdentifier:@"cellId"];
    }
    return _ado_collectionView;
}


-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.allPhotoArr.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    if (_allPhotoArr.count) {
        NSString *cellId = [NSString stringWithFormat:@"cell%ld", (long)indexPath.row];
        myPhotoCell *cell = (myPhotoCell *)[collectionView dequeueReusableCellWithReuseIdentifier:cellId forIndexPath:indexPath];
        NSString *url = _allPhotoArr[indexPath.row][@"url"];
        NSArray *arr = [url componentsSeparatedByString:@"/"];
        
        [cell.photoView sd_setImageWithURL:[NSURL URLWithString:url] placeholderImage:[UIImage imageNamed:@"ac_pic_list_dg@3x"]];
        cell.titleLabel.text = arr.lastObject;
        return cell;
    } else {
        myPhotoCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cellId" forIndexPath:indexPath];
        
        return cell;
    }
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (!_chooseArray) {
        _chooseArray = [[NSMutableArray alloc]init];
    }
    if (!_chooseCellArray) {
        _chooseCellArray = [[NSMutableArray alloc]init];
    }
    
    myPhotoCell *cell = (myPhotoCell *)[collectionView cellForItemAtIndexPath:indexPath];
    if (cell.chooseStatus == NO) {
        NSDictionary *dict = [_allPhotoArr objectAtIndex:indexPath.row];
        
        [_chooseArray addObject:dict];
        [_chooseCellArray addObject:[NSString stringWithFormat:@"%ld",(long)indexPath.row]];

        
        cell.chooseStatus = YES;
        [cell statusChanged];
    } else {
        for (NSInteger j = 0; j<_chooseCellArray.count; j++) {
            
            NSIndexPath *ip = [NSIndexPath indexPathForRow:[_chooseCellArray[j] integerValue] inSection:0];
            
            if (indexPath.row == ip.row) {
                [_chooseArray removeObjectAtIndex:j];
            }
        }
        [_chooseCellArray removeObject:[NSString stringWithFormat:@"%ld",(long)indexPath.row]];
        
        cell.chooseStatus = NO;
        [cell statusChanged];
    }
}

@end
