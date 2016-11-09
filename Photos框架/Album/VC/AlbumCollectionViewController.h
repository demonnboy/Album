//
//  AlbumCollectionViewController.h
//  Photos框架
//
//  Created by 曹旋 on 16/11/8.
//  Copyright © 2016年 CX. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ParentCollectionViewController.h"
@class AlbumCollectionViewController;
@protocol AlbumCollectionViewControllerDelegate <NSObject>

@optional
- (void)albumCollectionViewController:(AlbumCollectionViewController *)albumVC imageArray:(NSMutableArray<UIImage *> *)imagesArray;

@end

@interface AlbumCollectionViewController : ParentCollectionViewController
@property(assign, nonatomic) id<AlbumCollectionViewControllerDelegate>delegate;
@end
