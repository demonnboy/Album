//
//  SiglePhotoCollectionViewCell.m
//  Photos框架
//
//  Created by 曹旋 on 16/11/8.
//  Copyright © 2016年 CX. All rights reserved.
//

#import "SiglePhotoCollectionViewCell.h"

@implementation SiglePhotoCollectionViewCell
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self = [[NSBundle mainBundle] loadNibNamed:NSStringFromClass([self class]) owner:self options:nil].lastObject;
    }
    return self;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    self.sigleImageView.contentMode = UIViewContentModeScaleAspectFill;
    self.sigleImageView.clipsToBounds = YES;
}

@end
