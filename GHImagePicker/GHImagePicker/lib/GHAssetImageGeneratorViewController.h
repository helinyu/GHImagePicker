//
//  GHAssetImageGeneratorViewController.h
//  GHImagePicker
//
//  Created by mac on 19/4/18.
//  Copyright © 2018年 mac. All rights reserved.
//

#import "GHBaseViewController.h"
@class PHAsset;

typedef NS_ENUM(NSInteger, YDVideoSourceType) {
    YDVideoSourceTypeUrl,
    YDVideoSourceTypeUrlString,
    YDVideoSourceTypeAsset,
};

@interface GHAssetImageGeneratorViewController : GHBaseViewController

typedef void (^SelectUrlBlock)(NSURL *videoURL, UIImage *choosenCover);
- (void)configureWithVideoUrlString:(NSString *)videoUrlString showNum:(NSInteger)showNum sourceType:(YDVideoSourceType)sourceType then:(SelectUrlBlock)then;
- (void)configureWithVideoUrl:(NSURL *)videoUrl showNum:(NSInteger)showNum sourceType:(YDVideoSourceType)sourceType then:(SelectUrlBlock)then;

typedef void (^SelectAssetBlock)(PHAsset *asset);
- (void)configureWithTzAsset:(PHAsset *)asset showNum:(NSInteger)showNum type:(YDVideoSourceType)type then:(SelectAssetBlock)then;

@end
