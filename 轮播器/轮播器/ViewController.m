//
//  ViewController.m
//  轮播器
//
//  Created by KIMI on 16/11/13.
//  Copyright © 2016年 KIMI. All rights reserved.
//

#import "ViewController.h"
#import "customCollectionView.h"
@interface ViewController ()

@end

@implementation ViewController {
    
    NSArray<NSURL *> *_urls;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self loadData];
    
    customCollectionView *view = [[customCollectionView alloc]initWithUrls:_urls];
    
    view.frame = CGRectMake(20, 20, self.view.bounds.size.width - 40, 100);
    
    [self.view addSubview:view];
    
}

- (void)loadData {
    
    //加载数据
    
    NSMutableArray *marr = [NSMutableArray array];
    
    for (NSInteger i = 0; i < 3; i++) {
        
        NSString *fileName = [NSString stringWithFormat:@"%02zd.jpg",i+1];
        
        NSURL *url = [[NSBundle mainBundle]URLForResource:fileName withExtension:nil];
        
        [marr addObject: url];
    }
    _urls = marr.copy;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
