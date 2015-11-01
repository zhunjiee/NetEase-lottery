//
//  ZJGroupItem.h
//  彩票彩票
//
//  Created by 侯宝伟 on 15/8/31.
//  Copyright (c) 2015年 ZHUNJIEE. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZJGroupItem : NSObject
// 记录组的头部标题
@property (nonatomic, strong) NSString *headerTitle;
// 记录组的尾部标题
@property (nonatomic, strong) NSString *footerTitle;

// 记录当前组有多少行

// 行模型数组
@property (nonatomic, strong) NSArray *items;

@end
