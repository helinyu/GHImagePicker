//
//  GHDefine.h
//  GHImagePicker
//
//  Created by mac on 19/4/18.
//  Copyright © 2018年 mac. All rights reserved.
//

#ifndef GHDefine_h
#define GHDefine_h

#define GH_SCREEN_WIDTH MIN([UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height)
#define GH_SCREEN_HEIGHT MAX([UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height)
#define GH_SCREEN_BOUNDS CGRectMake(0,0,GH_SCREEN_WIDTH, GH_SCREEN_HEIGHT)
#define GH_SCREEN_SIZE CGSizeMake(GH_SCREEN_WIDTH, GH_SCREEN_HEIGHT)
#define GH_SCREEN_CENTER CGPointMake(GH_SCREEN_WIDTH * 0.5, GH_SCREEN_HEIGHT * 0.5)

#define GH_DYNAMIC_VC_VIEW(ViewClass) \
@dynamic view; \
- (void)loadView { \
    self.view = [[ViewClass alloc] initWithFrame:GH_SCREEN_BOUNDS]; \
}

#define GH_BOTTOM_FIX ([UIScreen mainScreen].bounds.size.height == 812 ? 34 : 0)
#define GH_TOP_FIX ([UIScreen mainScreen].bounds.size.height == 812 ? 22 : 0)
#define GH_STATUS_BAR_H ([UIScreen mainScreen].bounds.size.height == 812 ? 44 : 20)
#define GH_TOP_LAYOUT_H ([UIScreen mainScreen].bounds.size.height == 812 ? 88 : 64)
#define GH_TAB_BAR_H ([UIScreen mainScreen].bounds.size.height == 812 ? 83 : 49)

#endif /* GHDefine_h */
