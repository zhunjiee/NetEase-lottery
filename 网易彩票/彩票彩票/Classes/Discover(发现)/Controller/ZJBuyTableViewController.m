//
//  ZJBuyTableViewController.m
//  彩票彩票
//
//  Created by 侯宝伟 on 15/8/27.
//  Copyright (c) 2015年 ZHUNJIEE. All rights reserved.
//

#import "ZJBuyTableViewController.h"
#import "ZJTitleButton.h"
#import "UIView+Frame.h"

@interface ZJBuyTableViewController ()

@end

@implementation ZJBuyTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 创建按钮
    UIButton *btn = [ZJTitleButton buttonWithType:UIButtonTypeCustom];
    [btn setImage:[UIImage imageNamed:@"YellowDownArrow"] forState:UIControlStateNormal];
    [btn setTitle:@"全部彩种" forState:UIControlStateNormal];
    
    self.navigationItem.titleView = btn;
    
}

@end
