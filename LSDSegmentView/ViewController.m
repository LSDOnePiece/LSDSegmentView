//
//  ViewController.m
//  LSDSegmentView
//
//  Created by 神州锐达 on 17/3/30.
//  Copyright © 2017年 OnePiece. All rights reserved.
//

#import "ViewController.h"
#import "LSDSegmentView.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.view.backgroundColor = [UIColor redColor];
    
    LSDSegmentView *segmentView = [[LSDSegmentView alloc]initWithFrame:CGRectMake(10, 100, 240, 40) TitleArray:@[@"热门",@"分类",@"订阅"]];
    
    [self.view addSubview:segmentView];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
