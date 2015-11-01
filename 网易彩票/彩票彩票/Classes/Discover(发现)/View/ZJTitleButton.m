//
//  ZJTitleButton.m
//  彩票彩票
//
//  Created by 侯宝伟 on 15/8/28.
//  Copyright (c) 2015年 ZHUNJIEE. All rights reserved.
//

#import "ZJTitleButton.h"
#import "UIView+Frame.h"

@implementation ZJTitleButton

/*自定义"合买"导航栏标题按钮*/


// 禁用高亮状态
- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.adjustsImageWhenHighlighted = NO;
    }
    return self;
}
- (void)awakeFromNib{
    self.adjustsImageWhenHighlighted = NO;
}


// 内部自动计算图片和文字的尺寸
- (void)setTitle:(NSString *)title forState:(UIControlState)state{
    [super setTitle:title forState:state];
    
    // 自动计算
    [self sizeToFit];
}
- (void)setImage:(UIImage *)image forState:(UIControlState)state{
    [super setImage:image forState:state];
    
    [self sizeToFit];
}

// layoutSubviews调整内部子控件的位置
- (void)layoutSubviews{
    [super layoutSubviews];
    
    // 调整内部子控件的位置
    // layoutSubviews可能会来多次,所以需要判断
    if (self.titleLabel.x > self.imageView.x) {
        self.titleLabel.x = self.imageView.x;
        self.imageView.x = CGRectGetMaxX(self.titleLabel.frame);
    }
}
@end
