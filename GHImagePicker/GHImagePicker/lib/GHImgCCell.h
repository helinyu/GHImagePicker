//
//  GHImgCCell.h
//  GHImagePicker
//
//  Created by mac on 19/4/18.
//  Copyright © 2018年 mac. All rights reserved.
//

#import "GHBaseCCell.h"

@interface GHImgCCell : GHBaseCCell

@property (nonatomic, strong, readonly) UIImageView *imgView;

- (void)configureWithImg:(UIImage *)img;

@end
