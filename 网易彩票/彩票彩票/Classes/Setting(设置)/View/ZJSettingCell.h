//
//  ZJSettingCell.h
//  彩票彩票
//
//  Created by 侯宝伟 on 15/8/31.
//  Copyright (c) 2015年 ZHUNJIEE. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ZJSettingItem;
@interface ZJSettingCell : UITableViewCell

+ (instancetype)cellWithTableView:(UITableView *)tableView style:(UITableViewCellStyle)cellStyle;

@property (nonatomic, strong) ZJSettingItem *item;

@end
