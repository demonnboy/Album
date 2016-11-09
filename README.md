# Album
version 1.0

这是一个非常简单的相册多选

在VC中使用这个方法
[[PhotoManager shareInstance] pushPhotoVC:self delegate:self];

回调代理
- (void)albumCollectionViewController:(AlbumCollectionViewController *)albumVC imageArray:(NSMutableArray<UIImage *> *)imagesArray;
数组里面就是照片
