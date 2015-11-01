//
//  ZJSettingViewController.m
//  彩票彩票
//
//  Created by 侯宝伟 on 15/8/30.
//  Copyright (c) 2015年 ZHUNJIEE. All rights reserved.
//

#import "ZJSettingViewController.h"
#import "ZJPushViewController.h"

@implementation ZJSettingViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"设置";
    
    [self setUpGroup0];
    [self setUpGroup1];
    [self setUpGroup2];
    
}

- (void)setUpGroup0{
    // 创建组模型
    ZJGroupItem *group = [[ZJGroupItem alloc] init];
    group.headerTitle = @"欢迎来到猴哥彩票";
    // 创建行模型
    ZJSettingItem *item = [ZJArrowItem itemWithIcon:[UIImage imageNamed:@"RedeemCode"] title:@"使用兑换码"];
    
    
    // 创建行模型数组
    group.items = @[item];
    // 把组模型保存到_groups数组中
    [self.groups addObject:group];
}

- (void)setUpGroup1{
    // 创建组模型
    ZJGroupItem *group = [[ZJGroupItem alloc] init];
    
    // 创建行模型
    ZJArrowItem *item1 = [ZJArrowItem itemWithIcon:[UIImage imageNamed:@"MorePush"] title:@"推送和提醒"];
    item1.descVcClass = [ZJPushViewController class];
    
    ZJSettingItem *item2 = [ZJSwitchItem itemWithIcon:[UIImage imageNamed:@"more_homeshake"] title:@"使用摇一摇机选"];
    ZJSettingItem *item3 = [ZJSwitchItem itemWithIcon:[UIImage imageNamed:@"MorePush"] title:@"声音效果"];
    ZJSettingItem *item4 = [ZJSwitchItem itemWithIcon:[UIImage imageNamed:@"More_LotteryRecommend"] title:@"购彩小助手"];
    // 创建行模型数组
    group.items = @[item1, item2, item3, item4];
    // 把组模型保存到_groups数组中
    [self.groups addObject:group];
}

- (void)setUpGroup2{
    // 创建组模型
    ZJGroupItem *group = [[ZJGroupItem alloc] init];
    
    // 创建行模型
    ZJSettingItem *item1 = [ZJArrowItem itemWithIcon:[UIImage imageNamed:@"MoreUpdate"] title:@"检查版本更新"];
    item1.operationBlock = ^(NSIndexPath *indexPath){
        NSLog(@"没有新的版本可供更新");
    };
    
    ZJSettingItem *item2 = [ZJArrowItem itemWithIcon:[UIImage imageNamed:@"MoreShare"] title:@"分享"];
    ZJSettingItem *item3 = [ZJArrowItem itemWithIcon:[UIImage imageNamed:@"MoreNetease"] title:@"产品推荐"];
    ZJSettingItem *item4 = [ZJArrowItem itemWithIcon:[UIImage imageNamed:@"MoreAbout"] title:@"关于"];
    // 创建行模型数组
    group.items = @[item1, item2, item3, item4];
    // 把组模型保存到_groups数组中
    [self.groups addObject:group];
}

@end
