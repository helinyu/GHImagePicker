//
//  GHAssetImageGeneratorView.m
//  GHImagePicker
//
//  Created by mac on 19/4/18.
//  Copyright © 2018年 mac. All rights reserved.
//

#import "GHAssetImageGeneratorView.h"
#import "GHBaseCView.h"
#import "GHBaseView.h"
#import "UIView+GHAdd.h"

@interface GHAssetImageGeneratorView ()

@property (nonatomic, strong) GHBaseCView *imgThumbnailCView;
@property (nonatomic, strong) GHBaseView *thumbnailSquareView;
@property (nonatomic, strong) UIImageView *currentImgView;
@property (nonatomic, strong) GHBaseView *maskView;

@end

@implementation GHAssetImageGeneratorView

- (void)baseInit {
    [super baseInit];
    
    _imgThumbnailCView = [[GHBaseCView alloc] initWithFrame:CGRectZero collectionViewLayout:[UICollectionViewFlowLayout new]];
    _thumbnailSquareView = [GHBaseView new];
    _currentImgView = [UIImageView new];
    _maskView = [GHBaseView new];
    [self ghi_addSubviews:@[_imgThumbnailCView, _currentImgView, _thumbnailSquareView, _maskView]];
    
}

@end
