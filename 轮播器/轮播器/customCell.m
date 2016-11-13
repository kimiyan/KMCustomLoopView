//
//  customCell.m
//  轮播器
//
//  Created by KIMI on 16/11/13.
//  Copyright © 2016年 KIMI. All rights reserved.
//

#import "customCell.h"

@implementation customCell {
    
    UIImageView *_imageView;
}
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        //添加图像
        _imageView = [[UIImageView alloc]initWithFrame:self.bounds];
        [self.contentView addSubview:_imageView];
    }
    return self;
}
- (void)setUrl:(NSURL *)url {
    
    _url = url;
    
    //data
    NSData *data = [NSData dataWithContentsOfURL:url];
    UIImage *image = [UIImage imageWithData:data];
    
    _imageView.image = image;
}
@end
