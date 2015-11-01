//
//  ZJArenaViewController.m
//  彩票彩票
//
//  Created by 侯宝伟 on 15/8/25.
//  Copyright (c) 2015年 ZHUNJIEE. All rights reserved.
//

#import "ZJArenaViewController.h"
#import "ZJArenaView.h"

#define ZJColor(r, g, b) [UIColor colorWithRed:r / 255.0 green:g / 255.0 blue:b / 255.0 alpha:1]

@interface ZJArenaViewController ()

@end

@implementation ZJArenaViewController

// 加载画的背景
- (void)loadView{
    ZJArenaView *view = [[ZJArenaView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.view = view;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UISegmentedControl *segment = [[UISegmentedControl alloc] initWithItems:@[@"足球", @"篮球"]];
    // 默认选中第0个
    segment.selectedSegmentIndex = 0;
    
    // 设置按钮背景图片
    [segment setBackgroundImage:[UIImage imageNamed:@"CPArenaSegmentBG"] forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
    [segment setBackgroundImage:[UIImage imageNamed:@"CPArenaSegmentSelectedBG"] forState:UIControlStateSelected barMetrics:UIBarMetricsDefault];
    
    // 设置主题颜色
    segment.tintColor = ZJColor(0, 142, 143);
    
    // 设置文字颜色
    [segment setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor]} forState:UIControlStateSelected];
    
    // 将设置好的segment按钮添加到导航条的中间的view
    self.navigationItem.titleView = segment;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
