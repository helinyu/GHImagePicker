//
//  GHAssetImageGeneratorView.h
//  GHImagePicker
//
//  Created by mac on 19/4/18.
//  Copyright © 2018年 mac. All rights reserved.
//

#import "GHBaseView.h"
@class GHBaseCView;

@interface GHAssetImageGeneratorView : GHBaseView

@property (nonatomic, strong, readonly) GHBaseCView *imgThumbnailCView;
@property (nonatomic, strong, readonly) GHBaseView *thumbnailSquareView;
@property (nonatomic, strong, readonly) UIImageView *currentImgView;
@property (nonatomic, strong, readonly) GHBaseView *maskView;
@property (nonatomic, strong, readonly) GHBaseView *bottomWrapView;
@property (nonatomic, strong, readonly) UISlider *choiceSlider;

@end
