//
//  ZJNewFetureCollectionViewController.m
//  彩票彩票
//
//  Created by 侯宝伟 on 15/8/29.
//  Copyright (c) 2015年 ZHUNJIEE. All rights reserved.
//

#import "ZJNewFetureCollectionViewController.h"
#import "ZJNewFetureCell.h"
#import "UIView+Frame.h"

@interface ZJNewFetureCollectionViewController () <UIScrollViewDelegate>

@property (nonatomic, assign) CGFloat lastOffsetX;
@property (nonatomic, weak) UIImageView *guide;
@property (nonatomic, weak) UIImageView *largeText;
@property (nonatomic, weak) UIImageView *smalltext;

@end

@implementation ZJNewFetureCollectionViewController

/**
 使用UICollectionView的步骤:
 1. 设置流水布局
 2. UICollectionViewCell只能注册
 3. 必须自定义UICollectionViewCell
 */

// 重写init方法创建
- (instancetype)init{
    // 流水布局
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    // 设置cell的尺寸
    layout.itemSize = [UIScreen mainScreen].bounds.size;
    // 设置每一行的间距
    layout.minimumLineSpacing = 0;
    // 设置每个cell的间距
    layout.minimumInteritemSpacing = 0;
    // 设置滚动方向
    layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    
    
    return [self initWithCollectionViewLayout:layout];
    
}


static NSString *ID = @"Cell";

- (void)viewDidLoad {
    [super viewDidLoad];

    [self setUpCollectionView];
    
    [self setUpChildView];
    
    // 初始化
    _lastOffsetX = 0;
}

// 设置collectionView的子控件
- (void)setUpChildView{
    
    // guide
    UIImageView *guide = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"guide1"]];
    // 设置centerX
    guide.centerX = self.view.center.x;
    guide.centerY = self.view.bounds.size.height * 0.4;
    _guide = guide;
    [self.collectionView addSubview:guide];
    
    // largeText
    UIImageView *largeText = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"guideLargeText1"]];
    largeText.centerX = self.view.center.x;
    largeText.centerY = self.view.height * 0.8;
    _largeText = largeText;
    [self.collectionView addSubview:largeText];

    // smallText
    UIImageView *smallText = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"guideSmallText1"]];
    smallText.centerX = self.view.center.x;
    smallText.centerY = self.view.height * 0.9;
    _smalltext = smallText;
    [self.collectionView addSubview:smallText];

    // guideLine
    UIImageView *guideLine = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"guideLine"]];
    guideLine.x = -175;
    guideLine.centerY = self.view.height * 0.4;
    [self.collectionView addSubview:guideLine];
}


// 设置CollectionView
- (void)setUpCollectionView{
    
    // 注意:self.collectionView 不等于 self.view
    
    self.collectionView.backgroundColor = [UIColor whiteColor];
    
    // 注册cell
    [self.collectionView registerClass:[ZJNewFetureCell class] forCellWithReuseIdentifier:ID];
    
    
    // 取消弹簧效果
    self.collectionView.bounces = NO;
    // 取消显示指示器
    self.collectionView.showsHorizontalScrollIndicator = NO;
    // 开启分页模式
    self.collectionView.pagingEnabled = YES;
}


#pragma mark <UICollectionViewDataSource>
// 返回有多少个cell
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 4;
}



// 返回每个cell长什么样子
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    ZJNewFetureCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:ID forIndexPath:indexPath];
    
    NSString *imageName = [NSString stringWithFormat:@"guide%ldBackground", indexPath.row + 1];
    
    cell.image = [UIImage imageNamed:imageName];
    
    [cell setIndexPath:indexPath count:4];
    
    
    return cell;
}


// 滚动完成的时候调用
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    // 获取最新的偏移量
    CGFloat offsetX = scrollView.contentOffset.x;
    
    // 计算相对于上一次的偏移差
    CGFloat delta = offsetX - _lastOffsetX;
    
    _guide.x += delta * 2;
    _largeText.x += delta * 2;
    _smalltext.x += delta * 2;
    
    [UIView animateWithDuration:0.25 animations:^{
        _guide.x -= delta;
        _largeText.x -= delta;
        _smalltext.x -= delta;
    } completion:^(BOOL finished) {
        
    }];
    
    // 更新最新的偏移量
    _lastOffsetX = offsetX;
    
    
    // 重新设置图片
    int page = (int)(_lastOffsetX / self.view.width + 1);

    _guide.image = [UIImage imageNamed:[NSString stringWithFormat:@"guide%d", page]];
    _largeText.image = [UIImage imageNamed:[NSString stringWithFormat:@"guideLargeText%d", page]];
    _smalltext.image = [UIImage imageNamed:[NSString stringWithFormat:@"guideSmallText%d", page]];
    
}

@end
