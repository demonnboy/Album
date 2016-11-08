//
//  ViewController.m
//  Photos框架
//
//  Created by 曹旋 on 16/11/7.
//  Copyright © 2016年 CX. All rights reserved.
//

#import "ViewController.h"
#import <Photos/Photos.h>
#import "PhotoAblumVC.h"
#import "AlbumCollectionViewController.h"
#import "PhotoManager.h"
@interface ViewController ()<AlbumCollectionViewControllerDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    PHFetchResult<PHAssetCollection *> *assetCollections = [PHAssetCollection fetchAssetCollectionsWithType:PHAssetCollectionTypeAlbum subtype:PHAssetCollectionSubtypeAlbumRegular options:nil];
    for (PHAssetCollection *assetCollection in assetCollections) {NSLog(@"%@",assetCollection.localizedTitle);}
    
}

- (IBAction)switchVC:(id)sender
{
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    layout.scrollDirection = UICollectionViewScrollDirectionVertical;
    AlbumCollectionViewController *vc = [[AlbumCollectionViewController alloc] initWithCollectionViewLayout:layout];
    vc.delegate = self;
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:vc];
    [self presentViewController:nav animated:YES completion:nil];
}

- (void)albumCollectionViewController:(AlbumCollectionViewController *)albumVC imageArray:(NSMutableArray<UIImage *> *)imagesArray
{
    NSLog(@"%@",imagesArray);
    [albumVC dismissViewControllerAnimated:YES completion:nil];
    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:[NSString stringWithFormat:@"你选择了%lu张照片",(unsigned long)imagesArray.count] message:@"" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil];
    [alert show];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
