//
//  ZJAwardViewController.m
//  彩票彩票
//
//  Created by 侯宝伟 on 15/9/5.
//  Copyright (c) 2015年 ZHUNJIEE. All rights reserved.
//

#import "ZJAwardViewController.h"

@implementation ZJAwardViewController

- (void)viewDidLoad{
    [super viewDidLoad];
    [self setUpGroup0];
}

- (void)setUpGroup0{
    // 创建行模型
    ZJSwitchItem *item = [ZJSwitchItem itemWithIcon:nil title:@"双色球"];
    item.subTitle = @"每周二,四,六开奖";
    
    ZJSwitchItem *item1 = [ZJSwitchItem itemWithIcon:nil title:@"双色球"];
    ZJSwitchItem *item2 = [ZJSwitchItem itemWithIcon:nil title:@"双色球"];
    ZJSwitchItem *item3 = [ZJSwitchItem itemWithIcon:nil title:@"双色球"];
    
    ZJGroupItem *group = [[ZJGroupItem alloc] init];
    group.items = @[item, item1, item2, item3];
    [self.groups addObject:group];
}

// 重写cell方法,因为cell的样式和以前的不一样
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    // 创建cell
    ZJSettingCell *cell = [ZJSettingCell cellWithTableView:tableView style:UITableViewCellStyleSubtitle];
    
    // 获取对应组模型
    ZJGroupItem *group = self.groups[indexPath.section];
    
    // 获取对应行模型
    ZJSettingItem *item = group.items[indexPath.row];
    
    // 给cell传递模型,设置辅助视图等
    cell.item = item;
    
    return cell;
}

@end
