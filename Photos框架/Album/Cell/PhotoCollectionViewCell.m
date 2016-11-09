//
//  PhotoCollectionViewCell.m
//  Photos框架
//
//  Created by 曹旋 on 16/11/8.
//  Copyright © 2016年 CX. All rights reserved.
//

#import "PhotoCollectionViewCell.h"

@implementation PhotoCollectionViewCell

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
    self.albumImageView.layer.cornerRadius = 5;
    self.albumImageView.contentMode = UIViewContentModeScaleAspectFill;
    self.albumImageView.clipsToBounds = YES;
    self.albumImageView.layer.masksToBounds = YES;
}

@end
