//
//  AlbumInfo.m
//  Photos框架
//
//  Created by 曹旋 on 16/11/8.
//  Copyright © 2016年 CX. All rights reserved.
//

#import "AlbumInfo.h"

@implementation AlbumInfo

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.albumImages = [NSMutableArray array];
    }
    return self;
}

- (UIImage *)albumImage
{
    return self.albumImages.count > 0 ? self.albumImages[0] : nil;
}

- (NSString *)albumCount
{
    return [NSString stringWithFormat:@"%lu",(unsigned long)self.albumImages.count];
}

@end
