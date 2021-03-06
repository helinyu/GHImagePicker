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

    NSString *path = [[NSBundle mainBundle] pathForResource:@"1524188922" ofType:@"mp4"];
    GHAssetImageGeneratorViewController *vc = [GHAssetImageGeneratorViewController new];
    [vc configureWithVideoUrl:[NSURL fileURLWithPath:path] showNum:6 sourceType:YDVideoSourceTypeUrl then:^(NSURL *videoFileURL, UIImage *choosenCover) {
        NSLog(@" video file :%@",videoFileURL);
    }];
    [self presentViewController:vc animated:YES completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
