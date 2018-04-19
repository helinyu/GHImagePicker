//
//  ViewController.m
//  GHImagePicker
//
//  Created by mac on 19/4/18.
//  Copyright © 2018年 mac. All rights reserved.
//

#import "ViewController.h"
#import "GHAssetImageGeneratorViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self testImgPicker];
}

- (void)testImgPicker {
    GHAssetImageGeneratorViewController *vc = [GHAssetImageGeneratorViewController new];
    [vc configureWithVideoUrl:[NSURL URLWithString:@"http://ssl-ydqiniu.51yund.com/khbav9689792.mp4"] showNum:6 sourceType:YDVideoSourceTypeUrl then:^(NSURL *videoFileURL, UIImage *choosenCover) {
        
    }];
    [self presentViewController:vc animated:YES completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
