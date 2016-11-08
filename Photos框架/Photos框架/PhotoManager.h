//
//  PhotoManager.h
//  Photos框架
//
//  Created by 曹旋 on 16/11/8.
//  Copyright © 2016年 CX. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AlbumInfo.h"
@interface PhotoManager : NSObject

@property(strong, nonatomic) NSMutableArray<AlbumInfo *> *albumInfoArray;

+ (instancetype)shareInstance;
- (void)getAlbumArray:(void(^)())success;
@end
