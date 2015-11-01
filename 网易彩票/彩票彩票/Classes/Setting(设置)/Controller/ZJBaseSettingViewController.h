//
//  ZJBaseSettingViewController.h
//  彩票彩票
//
//  Created by 侯宝伟 on 15/9/5.
//  Copyright (c) 2015年 ZHUNJIEE. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "ZJSettingItem.h"
#import "ZJGroupItem.h"
#import "ZJSettingCell.h"
#import "ZJArrowItem.h"
#import "ZJSwitchItem.h"

@interface ZJBaseSettingViewController : UITableViewController

// 描述tableview有多少组
@property (nonatomic, strong) NSMutableArray *groups;


@end
