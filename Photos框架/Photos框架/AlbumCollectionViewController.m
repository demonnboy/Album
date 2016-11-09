//
//  AlbumCollectionViewController.m
//  Photos框架
//
//  Created by 曹旋 on 16/11/8.
//  Copyright © 2016年 CX. All rights reserved.
//

#import "AlbumCollectionViewController.h"
#import "PhotoCollectionViewCell.h"
#import "PhotoManager.h"
#import "DetailCollectionViewController.h"
@interface AlbumCollectionViewController ()<UICollectionViewDelegateFlowLayout,DetailCollectionViewControllerDelegate>
@property(strong, nonatomic) NSMutableArray<AlbumInfo *> *photoArray;
@end

@implementation AlbumCollectionViewController

static NSString * const reuseIdentifier = @"Cell";
- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"正在获取相簿...";
    [[PhotoManager shareInstance] getAlbumArray:^{
        self.photoArray = [PhotoManager shareInstance].albumInfoArray;
        self.title = @"相簿";
        [self.collectionView reloadData];
    }];

    [self.collectionView registerClass:[PhotoCollectionViewCell class] forCellWithReuseIdentifier:reuseIdentifier];
    UIBarButtonItem *leftBar = [[UIBarButtonItem alloc] initWithTitle:@"取消" style:UIBarButtonItemStylePlain target:self action:@selector(cancelBtnClick)];
    self.navigationItem.rightBarButtonItem = leftBar;
}

- (void)cancelBtnClick
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    float width = (kScreen.size.width - 50)/2.0;
    
    return CGSizeMake(width, width + width/3.0);
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(15, 15, 15, 15);
}

#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {

    return 1;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {

    return self.photoArray.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    PhotoCollectionViewCell *cell = (PhotoCollectionViewCell *)[collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    AlbumInfo *info = self.photoArray[indexPath.item];
    cell.albumImageView.image = info.albumImage;
    cell.albumName.text = info.albumName;
    cell.albumCount.text = info.albumCount;
    return cell;
    
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    AlbumInfo *info = self.photoArray[indexPath.item];
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    layout.scrollDirection = UICollectionViewScrollDirectionVertical;
    DetailCollectionViewController *detailVC = [[DetailCollectionViewController alloc] initWithCollectionViewLayout:layout];
    detailVC.a_delegate = self;
    detailVC.albumInfo = info;
    [self.navigationController pushViewController:detailVC animated:YES];
}

- (void)commiteBnt:(NSMutableArray<UIImage *> *)imagesArray
{
    [self dismissViewControllerAnimated:YES completion:nil];
    [self.delegate albumCollectionViewController:self imageArray:imagesArray];
}

@end
