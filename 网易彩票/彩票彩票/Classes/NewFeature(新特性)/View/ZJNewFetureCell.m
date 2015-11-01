//
//  ZJNewFetureCell.m
//  彩票彩票
//
//  Created by 侯宝伟 on 15/8/29.
//  Copyright (c) 2015年 ZHUNJIEE. All rights reserved.
//

#import "ZJNewFetureCell.h"
#import "UIView+Frame.h"
#import "ZJTabBarController.h"

@interface ZJNewFetureCell ()

@property (nonatomic, weak) UIImageView *imageView;
@property (nonatomic, weak) UIButton *startButton;
@end

@implementation ZJNewFetureCell

- (UIImageView *)imageView{
    if (_imageView == nil) {
        UIImageView *imageView = [[UIImageView alloc] init];
        _imageView = imageView;
        
        [self.contentView addSubview:imageView];
    }
    return _imageView;
}

- (void)setImage:(UIImage *)image{
    _image = image;
    
    self.imageView.image = image;
}



- (UIButton *)startButton{
    if (_startButton == nil) {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        _startButton = button;
        
        [button setBackgroundImage:[UIImage imageNamed:@"guideStart"] forState:UIControlStateNormal];
        [button sizeToFit];
        
        [button addTarget:self action:@selector(clickStart) forControlEvents:UIControlEventTouchUpInside];
        
        [self.contentView addSubview:button];
    }
    return _startButton;
}

- (void)clickStart{
    // 跳转到主框架界面
    
    // 创建tabBarVc
    ZJTabBarController *tabBarVc = [[ZJTabBarController alloc] init];
    
    // 切换根控制器进行跳转
    [UIApplication sharedApplication].keyWindow.rootViewController = tabBarVc;
    
    // 添加转场动画
    CATransition *anim = [CATransition animation];
    anim.type = @"rippleEffect";
    anim.duration = 0.6;
    [[UIApplication sharedApplication].keyWindow.layer addAnimation:anim forKey:nil];
}

- (void)setIndexPath:(NSIndexPath *)indexPath count:(NSInteger)count{
    if (indexPath.item == count - 1) {
        self.startButton.hidden = NO;
    }else{
        self.startButton.hidden = YES;
    }
}


- (void)layoutSubviews{
    [super layoutSubviews];
    
    self.startButton.center = CGPointMake(self.width * 0.5, self.height * 0.95);
    
    self.imageView.frame = self.bounds;
}

@end
