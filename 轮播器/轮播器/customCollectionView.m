//
//  customCollectionView.m
//  轮播器
//
//  Created by KIMI on 16/11/13.
//  Copyright © 2016年 KIMI. All rights reserved.
//

#import "customCollectionView.h"
#import "custonFlowLayout.h"
#import "customCell.h"
static NSString *cellID = @"cellID";
@interface customCollectionView ()<UICollectionViewDataSource,UICollectionViewDelegate>
@end
@implementation customCollectionView {
    NSArray<NSURL *> *_urls;
}

- (instancetype)initWithUrls: (NSArray <NSURL *> *)url
{
    self = [super initWithFrame:CGRectZero collectionViewLayout:[[custonFlowLayout alloc]init]];
   if (self) {
        self.dataSource = self;
       self.delegate = self;
        [self registerClass:[customCell class] forCellWithReuseIdentifier:cellID];
       _urls = url;
       
       NSIndexPath *path = [NSIndexPath indexPathForItem:_urls.count inSection:0];
       
       //主 队列异步  保证数据源方法执行完毕再滚动
       dispatch_async(dispatch_get_main_queue(), ^{
           [self scrollToItemAtIndexPath:path atScrollPosition:UICollectionViewScrollPositionLeft animated:NO];
       });
       
//       UIPageControl *pageControl = [[UIPageControl alloc]init];
//       pageControl.frame = self.frame;
//       pageControl.pageIndicatorTintColor = [UIColor greenColor];
//       pageControl.currentPageIndicatorTintColor = [UIColor orangeColor];
//       
//       [self addSubview:pageControl];
    }
    return self;
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    
    return _urls.count * 200;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    customCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellID forIndexPath:indexPath];
    cell.backgroundColor = [UIColor colorWithRed:arc4random_uniform(256)/255.0 green:arc4random_uniform(256)/255.0 blue:arc4random_uniform(256)/255.0 alpha:0.8];
    
    cell.url = _urls[indexPath.item % _urls.count];

    return cell;
}
//监听滚动位置
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    
    NSInteger offset = scrollView.contentOffset.x / scrollView.bounds.size.width;
    //如果是第0页 跳转到第一组第0页
    //最后一页 跳转到第0组最后一页
    if (offset == 0 || offset == [self numberOfItemsInSection:0] - 1) {
        
        NSLog(@"%zd",offset);
        
        if (offset == 0) {
            
            offset = _urls.count;
        }else {
            
            offset = _urls.count - 1;
        }
        //重新调整contentOffset
        scrollView.contentOffset = CGPointMake(scrollView.bounds.size.width * offset, 0);
    }
}
@end
