//
//  DetailCollectionViewController.h
//  Photos框架
//
//  Created by 曹旋 on 16/11/8.
//  Copyright © 2016年 CX. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AlbumInfo.h"
@class BottomView;
@class ImageModel;
#define kScreen [UIScreen mainScreen].bounds


@protocol DetailCollectionViewControllerDelegate <NSObject>
- (void)commiteBnt:(NSMutableArray<UIImage *> *)imagesArray;
@end

@interface DetailCollectionViewController : UICollectionViewController
@property(strong, nonatomic) AlbumInfo *albumInfo;
@property(assign, nonatomic) id<DetailCollectionViewControllerDelegate>a_delegate;
@end


@interface BottomView : UIView

@property(assign, nonatomic) NSInteger selectImageCount;

@property(strong, nonatomic) UIButton *commitBtn;

@end

@interface ImageModel : NSObject

@property(strong, nonatomic) NSIndexPath *indexPath;

@property(strong, nonatomic) UIImage *selectImage;

@end
