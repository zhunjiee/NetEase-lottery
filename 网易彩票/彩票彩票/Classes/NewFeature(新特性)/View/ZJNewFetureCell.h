//
//  ZJNewFetureCell.h
//  彩票彩票
//
//  Created by 侯宝伟 on 15/8/29.
//  Copyright (c) 2015年 ZHUNJIEE. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZJNewFetureCell : UICollectionViewCell

@property (nonatomic, strong) UIImage *image;

// 最后一页设置"立即体验"按钮
- (void)setIndexPath:(NSIndexPath *)indexPath count:(NSInteger)count;

@end
