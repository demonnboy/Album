//
//  ParentCollectionViewController.m
//  Photos框架
//
//  Created by 曹旋 on 16/11/9.
//  Copyright © 2016年 CX. All rights reserved.
//

#import "ParentCollectionViewController.h"

@interface ParentCollectionViewController ()

@end

@implementation ParentCollectionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.collectionView.backgroundColor = [UIColor whiteColor];
    self.navigationController.navigationBar.backgroundColor = [UIColor whiteColor];
    self.navigationController.navigationBar.tintColor = [UIColor blackColor];
    self.collectionView.alwaysBounceVertical = YES;
//    self.automaticallyAdjustsScrollViewInsets = NO;
    self.collectionView.showsHorizontalScrollIndicator = NO;
    self.collectionView.showsVerticalScrollIndicator = NO;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
