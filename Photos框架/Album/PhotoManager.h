//
//  PhotoManager.h
//  Photos框架
//
//  Created by 曹旋 on 16/11/8.
//  Copyright © 2016年 CX. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AlbumInfo.h"
#import "AlbumCollectionViewController.h"
@interface PhotoManager : NSObject

@property(strong, nonatomic) NSMutableArray<AlbumInfo *> *albumInfoArray;

+ (instancetype)shareInstance;

/**
 获取相册图片

 @param success 获取成功的回调
 */
- (void)getAlbumArray:(void(^)())success;

/**
 弹起相册

 @param parentVC 当前VC
 @param delegate 回调代理
 */
- (void)pushPhotoVC:(UIViewController *)parentVC delegate:(id<AlbumCollectionViewControllerDelegate>)delegate;
@end
