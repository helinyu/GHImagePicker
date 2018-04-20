//
//  GHImgCCell.m
//  GHImagePicker
//
//  Created by mac on 19/4/18.
//  Copyright © 2018年 mac. All rights reserved.
//

#import "GHImgCCell.h"

@interface GHImgCCell ()

@property (nonatomic, strong) UIImageView *imgView;
@property (nonatomic, strong)  UILabel *textLabel;

@end

@implementation GHImgCCell

- (void)baseInitWithFrame:(CGRect)frame {
    [super baseInitWithFrame:frame];
    
    self.imgView = [UIImageView new];
    [self.contentView addSubview:self.imgView];
    self.imgView.frame = self.contentView.bounds;
    self.imgView.contentMode = UIViewContentModeScaleAspectFill;
    self.contentView.layer.masksToBounds = YES;
}

- (void)configureWithImg:(UIImage *)img {
    self.imgView.image = img;
}

@end
