//
//  AlbumCollectionViewController.h
//  Photos框架
//
//  Created by 曹旋 on 16/11/8.
//  Copyright © 2016年 CX. All rights reserved.
//

#import <UIKit/UIKit.h>
#define kScreen [UIScreen mainScreen].bounds
@class AlbumCollectionViewController;
@protocol AlbumCollectionViewControllerDelegate <NSObject>

- (void)albumCollectionViewController:(AlbumCollectionViewController *)albumVC imageArray:(NSMutableArray<UIImage *> *)imagesArray;

@end

@interface AlbumCollectionViewController : UICollectionViewController
@property(assign, nonatomic) id<AlbumCollectionViewControllerDelegate>delegate;
@end
