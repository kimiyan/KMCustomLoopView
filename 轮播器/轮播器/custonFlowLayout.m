//
//  custonFlowLayout.m
//  轮播器
//
//  Created by KIMI on 16/11/13.
//  Copyright © 2016年 KIMI. All rights reserved.
//

#import "custonFlowLayout.h"

@implementation custonFlowLayout
-(void)prepareLayout {
    
    [super prepareLayout];
    
    self.itemSize = self.collectionView.bounds.size;
    self.minimumLineSpacing = 0;
    self.minimumInteritemSpacing = 0;
    self.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    self.collectionView.showsHorizontalScrollIndicator = NO;
    self.collectionView.showsVerticalScrollIndicator = YES;
    self.collectionView.pagingEnabled = YES;
    
}
@end
