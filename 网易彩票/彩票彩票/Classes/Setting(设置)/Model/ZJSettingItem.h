//
//  ZJSettingItem.h
//  彩票彩票
//
//  Created by 侯宝伟 on 15/8/30.
//  Copyright (c) 2015年 ZHUNJIEE. All rights reserved.
//

#import <Foundation/Foundation.h>

//typedef enum : NSUInteger {
//    ZJSettingItemTypeNone,
//    ZJSettingItemTypeArrow, // 箭头
//    ZJSettingItemTypeSwitch,// 开关
//} ZJSettingItemType;

@interface ZJSettingItem : NSObject

/*设置每一行的样式*/
@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) UIImage *icon;
@property (nonatomic, strong) NSString *subTitle;

/*设置block保存每一行cell要做的事情*/
@property (nonatomic, strong) void(^operationBlock)(NSIndexPath *indexPath);

+ (instancetype)itemWithIcon:(UIImage *)icon title:(NSString *)title;

// 描述cell的样式
//@property (nonatomic, assign) ZJSettingItemType type;

@end
