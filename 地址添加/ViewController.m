//
//  ViewController.m
//  地址添加
//
//  Created by Zhangguodong on 16/11/17.
//  Copyright © 2016年 ZGD. All rights reserved.
//

#import "ViewController.h"
#import "AddView.h"
#import "UIViewExt.h"
#import "SecondViewController.h"

@interface ViewController ()<AddViewDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    AddView *view = [[AddView alloc] initWithFrame:CGRectMake(0, 100, self.view.width, 60)];
    view.backgroundColor = [UIColor orangeColor];
    view.delegate = self;
    [self.view addSubview:view];
}
#pragma mark - AddViewDelegate
- (void)AddView:(AddView *)addView labels:(NSMutableArray *)arr {
    NSLog(@"%@",arr);
    
}

@end
