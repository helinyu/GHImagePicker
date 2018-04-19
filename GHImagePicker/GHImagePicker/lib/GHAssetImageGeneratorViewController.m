//
//  GHAssetImageGeneratorViewController.m
//  GHImagePicker
//
//  Created by mac on 19/4/18.
//  Copyright © 2018年 mac. All rights reserved.
//

#import "GHAssetImageGeneratorViewController.h"
#import "GHAssetImageGeneratorView.h"
#import <AVFoundation/AVFoundation.h>
#import "GHBaseCView.h"
#import "GHImgCCell.h"

@interface GHAssetImageGeneratorViewController ()<UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>

@property (nonatomic, strong) GHAssetImageGeneratorView *view;

//some data property
@property (nonatomic, assign) NSInteger showNum;
@property (nonatomic, assign) YDVideoSourceType sourceType;
@property (nonatomic, strong) NSURL *videoUrl;
@property (nonatomic, strong) NSString *videoUrlString;
@property (nonatomic, assign) CMTime videoDuration;
@property (nonatomic, strong) AVAssetImageGenerator *imgGenerator;

@property (nonatomic, copy) SelectUrlBlock selctUrlBlock;
@property (nonatomic, strong) NSMutableArray<UIImage *> *mImgs;
@property (nonatomic, strong) NSMutableArray<UIImage *> *mThumbNailImgs;
@property (nonatomic, assign) CGFloat thumbNailLength;

@end

static NSInteger const kDefaultShowNum = 6;
static NSString * const kAssetGeneratorThumbnailCIdnetifier = @"asset.generator.thumbnail.c.identifier";

@implementation GHAssetImageGeneratorViewController

GH_DYNAMIC_VC_VIEW([GHAssetImageGeneratorView class]);

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view.imgThumbnailCView registerClass:[GHImgCCell class] forCellWithReuseIdentifier:kAssetGeneratorThumbnailCIdnetifier];
    self.view.imgThumbnailCView.dataSource = self;
    self.view.imgThumbnailCView.delegate = self;
    
}

- (void)configureWithVideoUrlString:(NSString *)videoUrlString showNum:(NSInteger)showNum type:(YDVideoSourceType)type then:(SelectUrlBlock)then {
    [self configureWithVideoUrl:[NSURL URLWithString:videoUrlString] showNum:showNum sourceType:type then:then];
}

- (void)configureWithVideoUrl:(NSURL *)videoUrl showNum:(NSInteger)showNum sourceType:(YDVideoSourceType)sourceType then:(SelectUrlBlock)then {
    self.sourceType = sourceType;
    self.videoUrl = videoUrl;
    self.videoUrlString = videoUrl.absoluteString;
    self.selctUrlBlock = then;
    self.showNum = showNum ==0? showNum: kDefaultShowNum;
    [self __configureDataOfView];
}

// need to fix
- (void)configureWithTzAsset:(PHAsset *)asset showNum:(NSInteger)showNum type:(YDVideoSourceType)type then:(SelectAssetBlock)then {
    
}


#pragma mark - private methods

- (void)__generateImgFromVideo {
    if (!_mThumbNailImgs) _mThumbNailImgs = @[].mutableCopy;
    if (!_mImgs) _mImgs = @[].mutableCopy;
    AVURLAsset *urlAsset = [AVURLAsset assetWithURL:self.videoUrl];
    self.imgGenerator = [AVAssetImageGenerator assetImageGeneratorWithAsset:urlAsset];
    NSInteger baseCount = self.videoDuration.value /self.showNum;
    for (NSInteger i = 0 ; i < self.showNum; i++) {
        NSError *error = nil;
        CGImageRef img = [self.imgGenerator copyCGImageAtTime:CMTimeMake(i * baseCount + baseCount/2, self.videoDuration.timescale) actualTime:NULL error:&error];
        if (img) {
            UIImage *image = [UIImage imageWithCGImage:img];
            [self.mImgs addObject:image];
        }
        CGImageRelease(img);
    }
}

- (void)__updateViewContentImg {
    CGFloat contentW = GH_SCREEN_WIDTH;
    CGFloat contentH = GH_SCREEN_HEIGHT - GH_BOTTOM_FIX -GH_TOP_LAYOUT_H;
    CGFloat showImgH = contentH -self.thumbNailLength;
    self.view.currentImgView.frame = CGRectMake(0.f, GH_TOP_FIX, contentW, showImgH);
    self.view.imgThumbnailCView.frame = CGRectMake(0.F, GH_TOP_FIX+showImgH, contentW, self.thumbNailLength);
}

- (void)__configureDataOfView {
   
    [self __generateImgFromVideo];
    self.thumbNailLength= GH_SCREEN_WIDTH/_showNum;
    [self __updateViewContentImg];
   
    dispatch_async(dispatch_get_main_queue(), ^{
        [self.view.imgThumbnailCView reloadData];
        [UIView animateWithDuration:0.5f animations:^{
            self.view.maskView.alpha = 0.f;
        }];
    });
}

#pragma mark - collecitonview datasource & delegate

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.mImgs.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    GHImgCCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:kAssetGeneratorThumbnailCIdnetifier forIndexPath:indexPath];
    cell.imgView.image = _mImgs[indexPath.item];
    return cell;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    return CGSizeMake(self.thumbNailLength, self.thumbNailLength);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
