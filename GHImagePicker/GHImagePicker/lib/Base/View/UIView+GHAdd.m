//
//  UIView+GHAdd.m
//  GHImagePicker
//
//  Created by mac on 19/4/18.
//  Copyright © 2018年 mac. All rights reserved.
//

#import "UIView+GHAdd.h"

@implementation UIView (GHAdd)

- (void)ghi_addSubviews:(NSArray *)subViews {
    for (UIView *view in subViews) {
        [self addSubview:view];
    }
}

@end
