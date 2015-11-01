//
//  ZJScoreViewController.m
//  彩票彩票
//
//  Created by 侯宝伟 on 15/9/7.
//  Copyright (c) 2015年 ZHUNJIEE. All rights reserved.
//

#import "ZJScoreViewController.h"
#import "ZJSettingCell.h"

@interface ZJScoreViewController ()

@end

@implementation ZJScoreViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setUpGroup0];
    [self setUpGroup1];
    [self setUpGroup2];
    [self setUpGroup2];
    [self setUpGroup2];
    [self setUpGroup2];

}

- (void)setUpGroup0{
    // 创建行模型
    ZJSwitchItem *item = [ZJSwitchItem itemWithIcon:nil title:@"推送我关注的比赛"];
    
    
    ZJGroupItem *group = [[ZJGroupItem alloc] init];
    group.footerTitle = @"开启后,当我投注或关注的比赛开始,进球,结束时,会自动发送推送消息提醒我";
    group.items = @[item];
    [self.groups addObject:group];
}

- (void)setUpGroup1{
    ZJSettingItem *item = [ZJSettingItem itemWithIcon:nil title:@"起始时间"];
    item.subTitle = @"00:00";
    
    ZJGroupItem *group = [[ZJGroupItem alloc] init];
    group.headerTitle = @"只在以下时间接收比分直播推送";
    group.items = @[item];
    [self.groups addObject:group];
}

- (void)setUpGroup2{
    ZJSettingItem *item = [ZJSettingItem itemWithIcon:nil title:@"结束时间"];
    item.subTitle = @"23:59";
    
    
    // block原理:block会把代码块里面的所有强指针对象强引用
    // 在block里面不要使用self,可能会造成循环引用
    // 在block里尽量不要使用下划线成员属性
    
    // 解决循环引用
    // typeof:获取类型
    __weak typeof(self) weakSelf = self;
    
    // 点击cell弹出键盘
    item.operationBlock = ^(NSIndexPath *indexPath){
        UITextField *field = [[UITextField alloc] init];
        [field becomeFirstResponder];
        
        // 键盘处理:iOS7以后,只要把对应的文本框加入到对应的cell上,就自动做好键盘处理
        UITableViewCell *cell = [weakSelf.tableView cellForRowAtIndexPath:indexPath];
        
        [cell addSubview:field];
    };
    
    
    ZJGroupItem *group = [[ZJGroupItem alloc] init];
    group.headerTitle = @"只在以下时间接收比分直播推送";
    group.items = @[item];
    [self.groups addObject:group];
}


// 对象销毁的时候调用

- (void)dealloc{
    NSLog(@"%s", __func__);
}
@end
