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

@property (nonatomic, strong) GHBaseView *bottomWrapView;
@property (nonatomic, strong) GHBaseCView *imgThumbnailCView;
@property (nonatomic, strong) UISlider *choiceSlider;

@property (nonatomic, strong) GHBaseView *thumbnailSquareView;
@property (nonatomic, strong) UIImageView *currentImgView;
@property (nonatomic, strong) GHBaseView *maskView;

@end

@implementation GHAssetImageGeneratorView

- (void)baseInit {
    [super baseInit];
    
    _bottomWrapView = [GHBaseView new];
    _imgThumbnailCView = [[GHBaseCView alloc] initWithFrame:CGRectZero collectionViewLayout:[UICollectionViewFlowLayout new]];
    _choiceSlider = [UISlider new];
    _choiceSlider.backgroundColor = [UIColor clearColor];
    [_choiceSlider setMinimumTrackTintColor:[UIColor clearColor]];
    [_choiceSlider setMaximumTrackTintColor:[UIColor clearColor]];
    [_choiceSlider setMinimumValue:0.0];
    
    [_bottomWrapView ghi_addSubviews:@[_imgThumbnailCView, _choiceSlider]];
    
    _thumbnailSquareView = [GHBaseView new];
    _thumbnailSquareView.backgroundColor = [UIColor redColor];
    _currentImgView = [UIImageView new];
    _currentImgView.contentMode = UIViewContentModeScaleAspectFit;
    _maskView = [GHBaseView new];
    [self ghi_addSubviews:@[_bottomWrapView, _currentImgView, _thumbnailSquareView, _maskView]];
    
}

@end
