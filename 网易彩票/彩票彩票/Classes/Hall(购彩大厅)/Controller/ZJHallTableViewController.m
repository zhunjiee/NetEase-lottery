//
//  ZJHallTableViewController.m
//  彩票彩票
//
//  Created by 侯宝伟 on 15/8/26.
//  Copyright (c) 2015年 ZHUNJIEE. All rights reserved.
//

#import "ZJHallTableViewController.h"
#import "UIImage+Image.h"
#import "ZJCover.h"
#import "ZJPopMenu.h"

@interface ZJHallTableViewController () <ZJPopMenuDelegate>

@end

@implementation ZJHallTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 设置导航条左边的按钮
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageWithOriginalImageName:@"CS50_activity_image"] style:UIBarButtonItemStyleDone target:self action:@selector(activity)];
    
}

// 点击活动按钮的时候调用
- (void)activity{
    // 弹出蒙板
    [ZJCover show];
    
    CGFloat screenW = [UIScreen mainScreen].bounds.size.width * 0.5;
    CGFloat screenH = [UIScreen mainScreen].bounds.size.height * 0.5;
    
    ZJPopMenu *popMenu = [ZJPopMenu showPopMenuWithPoint:CGPointMake(screenW, screenH)];
    
    popMenu.delegate = self;
}


#pragma mark - ZJPopMenuDelegate
- (void)popMenuDidClickClose:(ZJPopMenu *)popMenu{
    [popMenu hidePopMenuInPoint:CGPointMake(44, 44) completion:^{
        [ZJCover hide];
    }];
}

@end
