//
//  ZJBaseSettingViewController.m
//  彩票彩票
//
//  Created by 侯宝伟 on 15/9/5.
//  Copyright (c) 2015年 ZHUNJIEE. All rights reserved.
//

#import "ZJBaseSettingViewController.h"



@implementation ZJBaseSettingViewController

- (NSMutableArray *)groups{
    if (_groups == nil) {
        _groups = [NSMutableArray array];
    }
    return _groups;
}

// 重写init设置为分组样式,因为在外面创建时直接用initWithStyle暴漏出来不好
- (instancetype)init{
    // 设置tableview分组
    return [self initWithStyle:UITableViewStyleGrouped];
}


- (void)viewDidLoad{
    [super viewDidLoad];
    
}

#pragma mark - Table view data source
// 返回有多少组
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.groups.count;
}
// 返回每一组有多少行
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    ZJGroupItem *group = self.groups[section];
    return group.items.count;
}

// 返回cell
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    ZJSettingCell *cell = [ZJSettingCell cellWithTableView:tableView style:UITableViewCellStyleValue1];
    
    // 获取对应的组模型
    ZJGroupItem *group = self.groups[indexPath.section];
    // 获取对应的行模型
    ZJSettingItem *item = group.items[indexPath.row];
    
    
    // 设置辅助视图
    cell.item = item;
    
    return cell;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    ZJGroupItem *group = self.groups[section];
    return group.headerTitle;
}

- (NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section{
    ZJGroupItem *group = self.groups[section];
    return group.footerTitle;
}


// 当cell被选中的时候调用,用于block的执行和界面的跳转
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    // 取出对应的组模型
    ZJGroupItem *group = self.groups[indexPath.section];
    // 取出对应的行模型
    ZJSettingItem *item = group.items[indexPath.row];
    // 有block执行block后直接返回,不需要再执行其它的操作了
    if (item.operationBlock) {
        item.operationBlock(indexPath);
        return;
    }
    
    // 判断下是否需要跳转
    if ([item isKindOfClass:[ZJArrowItem class]]) {
        // 箭头类型,需要跳转
        ZJArrowItem *arrowItem = (ZJArrowItem *)item;
        
        // 判断是否为空
        if (arrowItem.descVcClass == nil) return;
        
        // 创建跳转控制器
        UIViewController *vc = [[arrowItem.descVcClass alloc] init];
        //跳转
        [self.navigationController pushViewController:vc animated:YES];
    }
}

@end
