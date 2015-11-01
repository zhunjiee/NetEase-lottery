//
//  ZJSettingCell.m
//  彩票彩票
//
//  Created by 侯宝伟 on 15/8/31.
//  Copyright (c) 2015年 ZHUNJIEE. All rights reserved.
//

#import "ZJSettingCell.h"
#import "ZJSettingItem.h"

#import "ZJArrowItem.h"
#import "ZJSwitchItem.h"

@interface ZJSettingCell ()

@property (nonatomic, strong) UISwitch *switchView;

@end


@implementation ZJSettingCell

- (UISwitch *)switchView{
    if (_switchView == nil) {
        _switchView = [[UISwitch alloc] init];
    }
    return _switchView;
}

+ (instancetype)cellWithTableView:(UITableView *)tableView style:(UITableViewCellStyle)cellStyle{
    static NSString *ID = @"cell";
    
    ZJSettingCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    
    if (cell == nil) {
        cell = [[self alloc] initWithStyle:cellStyle reuseIdentifier:ID];
    }
    return cell;
}

- (void)setItem:(ZJSettingItem *)item{
    _item = item;
    
    // 设置cell内容,获取对应的行
    [self setUpDate];
    
    // 设置辅助视图
    [self setUpAccessoryView];

}

// 设置数据
- (void)setUpDate{
    // 设置cell的内容,获取对应的行
    self.textLabel.text = _item.title;
    self.imageView.image = _item.icon;
    self.detailTextLabel.text = _item.subTitle;
    self.detailTextLabel.textColor = [UIColor lightGrayColor];
}


// 设置右边的辅助视图
- (void)setUpAccessoryView{
    // 设置辅助视图
    if ([_item isKindOfClass:[ZJArrowItem class]]) { // 箭头
        self.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }else if ([_item isKindOfClass:[ZJSwitchItem class]]){ // 开关
        self.accessoryView = self.switchView;
    }else{
        self.accessoryView = nil;
        self.accessoryType = UITableViewCellAccessoryNone;
    }
//    NSLog(@"%@", _item);
}

@end
