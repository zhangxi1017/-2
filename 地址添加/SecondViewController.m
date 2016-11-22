
//
//  SecondViewController.m
//  地址添加
//
//  Created by Zhangguodong on 16/11/17.
//  Copyright © 2016年 ZGD. All rights reserved.
//

#import "SecondViewController.h"

@interface SecondViewController ()

@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.backgroundColor = [UIColor orangeColor];
    button.frame = CGRectMake(100, 100, 100, 30);
    [button addTarget:self action:@selector(btnAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    self.view.backgroundColor = [UIColor whiteColor];
}

- (void)btnAction {
    if (self.delegate && [self.delegate respondsToSelector:@selector(SecondViewController:address:)]) {
        [self.delegate SecondViewController:self address:[NSString stringWithFormat:@"%d",arc4random_uniform(256)]];
    }
    if (self.addressBlock) {
        self.addressBlock([NSString stringWithFormat:@"%d",arc4random_uniform(256)]);
    }
    [self.navigationController popViewControllerAnimated:YES];
}

@end
