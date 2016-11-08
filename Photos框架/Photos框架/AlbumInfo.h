//
//  AlbumInfo.h
//  Photos框架
//
//  Created by 曹旋 on 16/11/8.
//  Copyright © 2016年 CX. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <Photos/Photos.h>
@interface AlbumInfo : NSObject
/** !缩略图数组*/
@property(strong, nonatomic) NSMutableArray *albumImages;
/** !相册单张图*/
@property(strong, nonatomic,readonly) UIImage *albumImage;
/** !相册名字*/
@property(strong, nonatomic) NSString *albumName;
/** !照片数量*/
@property(strong, nonatomic,readonly) NSString *albumCount;
/** !对应的相册*/
@property(strong, nonatomic) PHAssetCollection *assetCollection;
@end
