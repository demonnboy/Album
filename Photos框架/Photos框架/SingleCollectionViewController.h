//
//  SingleCollectionViewController.h
//  Photos框架
//
//  Created by 曹旋 on 16/11/8.
//  Copyright © 2016年 CX. All rights reserved.
//

#import <UIKit/UIKit.h>
#define kScreen [UIScreen mainScreen].bounds
@interface SingleCollectionViewController : UICollectionViewController

@property(strong, nonatomic) NSMutableArray *albumArray;

@property(assign, nonatomic) NSIndexPath *item;

@end
