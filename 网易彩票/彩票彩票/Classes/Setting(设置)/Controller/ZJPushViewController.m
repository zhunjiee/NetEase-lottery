//
//  ZJPushViewController.m
//  彩票彩票
//
//  Created by 侯宝伟 on 15/9/5.
//  Copyright (c) 2015年 ZHUNJIEE. All rights reserved.
//

#import "ZJPushViewController.h"
#import "ZJAwardViewController.h"
#import "ZJScoreViewController.h"

@implementation ZJPushViewController

- (void)viewDidLoad{
    [super viewDidLoad];
    [self setUpGroup0];
}

- (void)setUpGroup0{
    // 创建行模型
    ZJArrowItem *item = [ZJArrowItem itemWithIcon:nil title:@"推送"];
    item.descVcClass = [ZJAwardViewController class];
    ZJArrowItem *item1 = [ZJArrowItem itemWithIcon:nil title:@"比分直播推送"];
    item1.descVcClass = [ZJScoreViewController class];
    ZJArrowItem *item2 = [ZJArrowItem itemWithIcon:nil title:@"推送"];
    ZJArrowItem *item3 = [ZJArrowItem itemWithIcon:nil title:@"推送"];
    
    ZJGroupItem *group = [[ZJGroupItem alloc] init];
    group.items = @[item, item1, item2, item3];
    [self.groups addObject:group];
}

@end
