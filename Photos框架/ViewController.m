//
//  ViewController.m
//  Photos框架
//
//  Created by 曹旋 on 16/11/7.
//  Copyright © 2016年 CX. All rights reserved.
//

#import "ViewController.h"
#import "AlbumCollectionViewController.h"
#import "PhotoManager.h"
@interface ViewController ()<AlbumCollectionViewControllerDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"照片多选";
    // Do any additional setup after loading the view, typically from a nib.
    
}

- (IBAction)switchVC:(id)sender
{
    [[PhotoManager shareInstance] pushPhotoVC:self delegate:self];
    [PhotoManager shareInstance].imageCount = 3;
}

- (void)albumCollectionViewController:(AlbumCollectionViewController *)albumVC imageArray:(NSMutableArray<UIImage *> *)imagesArray
{
    NSLog(@"%@",imagesArray);
    
    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:[NSString stringWithFormat:@"你选择了%lu张照片",(unsigned long)imagesArray.count] message:@"" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil];
    [alert show];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
