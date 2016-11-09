//
//  SingleCollectionViewController.h
//  Photos框架
//
//  Created by 曹旋 on 16/11/8.
//  Copyright © 2016年 CX. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ParentCollectionViewController.h"

@interface SingleCollectionViewController : ParentCollectionViewController

@property(strong, nonatomic) NSMutableArray *albumArray;

@property(assign, nonatomic) NSIndexPath *item;

@end
