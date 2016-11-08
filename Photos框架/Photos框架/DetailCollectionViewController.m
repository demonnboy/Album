//
//  DetailCollectionViewController.m
//  Photos框架
//
//  Created by 曹旋 on 16/11/8.
//  Copyright © 2016年 CX. All rights reserved.
//

#import "DetailCollectionViewController.h"
#import "SiglePhotoCollectionViewCell.h"
#import "SingleCollectionViewController.h"
@interface DetailCollectionViewController ()<UICollectionViewDelegateFlowLayout>
@property(strong, nonatomic) BottomView *bottomView;
@property(strong, nonatomic) NSMutableArray *imagesArr;
@end

@implementation DetailCollectionViewController

static NSString * const reuseIdentifierID = @"CellID";

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.bottomView];
    self.view.backgroundColor = [UIColor whiteColor];
    [self.collectionView setFrame:CGRectMake(0, 0, kScreen.size.width, kScreen.size.height - 50)];
    self.collectionView.alwaysBounceVertical = YES;
    self.title = self.albumInfo.albumName;
    self.collectionView.backgroundColor = [UIColor whiteColor];
    [self.collectionView registerClass:[SiglePhotoCollectionViewCell class] forCellWithReuseIdentifier:reuseIdentifierID];
}


#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {

    return 1;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {

    return self.albumInfo.albumImages.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    SiglePhotoCollectionViewCell *cell = (SiglePhotoCollectionViewCell *)[collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifierID forIndexPath:indexPath];
    UIImage *image = self.albumInfo.albumImages[indexPath.item];
    cell.sigleImageView.image = image;
    cell.selectImageView.image = nil;
    for (ImageModel *model in self.imagesArr) {
        if (model.indexPath.item == indexPath.item) {
            cell.selectImageView.image = [UIImage imageNamed:@"radiobtn_sec"];
        }
    }
    
    return cell;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{

    float width = (kScreen.size.width - 6)/4.0;
    
    return CGSizeMake(width, width);
}
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section
{
    return 2;
}
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section
{
    return 2;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    /*预览
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    SingleCollectionViewController *singleVC = [[SingleCollectionViewController alloc]initWithCollectionViewLayout:layout];
    singleVC.albumArray = self.albumInfo.albumImages;
    singleVC.item = indexPath;
    [self presentViewController:[[UINavigationController alloc] initWithRootViewController:singleVC] animated:YES completion:nil];
     */
    
    
    NSInteger index = 0;
    for (ImageModel *model in self.imagesArr) {
        if (model.indexPath.item == indexPath.item) {
            [self.imagesArr removeObject:model];
            index = 1;
            self.bottomView.selectImageCount = self.imagesArr.count;
            break;
        }
    }
    if (index == 0) {
        ImageModel *model = [[ImageModel alloc] init];
        model.indexPath = indexPath;
        model.selectImage = self.albumInfo.albumImages[indexPath.item];
        [self.imagesArr addObject:model];
        self.bottomView.selectImageCount = self.imagesArr.count;
    }
    
    [self.collectionView reloadItemsAtIndexPaths:@[indexPath]];
}

- (NSMutableArray *)imagesArr
{
    if (!_imagesArr) {
        _imagesArr = [NSMutableArray array];
    }
    return _imagesArr;
}

- (BottomView *)bottomView
{
    if (!_bottomView) {
        _bottomView = [[BottomView alloc] initWithFrame:CGRectMake(0, kScreen.size.height-50, kScreen.size.width, 50)];
        [_bottomView.commitBtn addTarget:self action:@selector(commitBtnClick) forControlEvents:UIControlEventTouchUpInside];
    }
    return _bottomView;
}

- (void)commitBtnClick
{
    NSMutableArray *imageArray = [NSMutableArray array];
    for (ImageModel *model in self.imagesArr) {
        [imageArray addObject:model.selectImage];
    }
    
    [self.navigationController popViewControllerAnimated:NO];
    
    [self.a_delegate commiteBnt:imageArray];
}

@end

@interface BottomView()

@property(strong, nonatomic) UILabel *selectImageLabel;

@end

@implementation BottomView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:self.selectImageLabel];
        [self addSubview:self.commitBtn];
        self.selectImageCount = 0;
    }
    return self;
}


- (UILabel *)selectImageLabel
{
    if (!_selectImageLabel) {
        _selectImageLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.frame)/2, CGRectGetHeight(self.frame))];
        _selectImageLabel.textColor = [UIColor lightGrayColor];
        _selectImageLabel.textAlignment = 0;
        _selectImageLabel.font = [UIFont systemFontOfSize:16];
    }
    return _selectImageLabel;
}

- (void)setSelectImageCount:(NSInteger )selectImageCount
{
    _selectImageCount = selectImageCount;
    self.selectImageLabel.text = [NSString stringWithFormat:@"    已选择%ld张照片",(long)selectImageCount];
}

- (UIButton *)commitBtn
{
    if (!_commitBtn) {
        _commitBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_commitBtn setTitle:@"确定    " forState:0];
        _commitBtn.titleLabel.font = [UIFont systemFontOfSize:16];
        _commitBtn.frame = CGRectMake(CGRectGetWidth(self.frame) - 40, 0, 40, CGRectGetHeight(self.frame));
        [_commitBtn setTitleColor:[UIColor blueColor] forState:0];
        
    }
    return _commitBtn;
}

@end

@implementation ImageModel
@end
