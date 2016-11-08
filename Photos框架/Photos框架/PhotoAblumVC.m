//
//  PhotoAblumVC.m
//  Photos框架
//
//  Created by 曹旋 on 16/11/7.
//  Copyright © 2016年 CX. All rights reserved.
//

#import "PhotoAblumVC.h"

@interface PhotoAblumVC ()<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>
@property(strong, nonatomic) UICollectionView *photoCollection;
@end

@implementation PhotoAblumVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.photoCollection];
    [self.photoCollection registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"cellId"];
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    
    return 100;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cellId" forIndexPath:indexPath];
    cell.backgroundColor = [UIColor colorWithRed:arc4random()%255/255.0 green:arc4random()%255/255.0 blue:arc4random()%255/255.0 alpha:1];
    return cell;
    
}


- (UICollectionView *)photoCollection{
    if (!_photoCollection) {
        //创建一个layout布局类
        UICollectionViewFlowLayout * layout = [[UICollectionViewFlowLayout alloc]init];
        //设置布局方向为垂直流布局
        layout.scrollDirection = UICollectionViewScrollDirectionVertical;
        //设置每个item的大小为100*100
        float width = (kScreen.size.width - 30)/3.0;
        layout.itemSize = CGSizeMake(width, width);
        _photoCollection = [[UICollectionView alloc] initWithFrame:kScreen collectionViewLayout:layout];
        _photoCollection.delegate = self;
        _photoCollection.dataSource = self;
        _photoCollection.backgroundColor = [UIColor whiteColor];
    }
    
    return _photoCollection;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
