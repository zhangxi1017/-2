
//
//  AddView.m
//  地址添加
//
//  Created by Zhangguodong on 16/11/17.
//  Copyright © 2016年 ZGD. All rights reserved.
//

#import "AddView.h"
#import "UIViewExt.h"
#import "SecondViewController.h"
#import "UIView+UIViewController.h"

@interface AddView ()<SecondViewControllerDelegate>

/**
 * 添加地址按钮
 */
@property(nonatomic,strong)UIButton *addButton;
/**
 * 具体的地址
 */
@property(nonatomic,strong)NSMutableArray *addressArrM;

@end

@implementation AddView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self addButton];
        self.labelsArrM = [NSMutableArray array];
        self.addressArrM = [NSMutableArray array];
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
}

#pragma mark - 添加地址按钮
- (UIButton *)addButton {
    if (_addButton == nil) {
        _addButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _addButton.frame = CGRectMake(0, 0, 60, self.height);
        [_addButton setTitle:@"添加" forState:UIControlStateNormal];
        [_addButton addTarget:self action:@selector(addAction:) forControlEvents:UIControlEventTouchUpInside];
        _addButton.backgroundColor = [UIColor purpleColor];
        [self addSubview:_addButton];
    }
    return _addButton;
}
NSInteger count = 0;

- (void)addAction:(UIButton *)button {
  
    SecondViewController *vc = [[SecondViewController alloc] init];
    vc.delegate = self;
    [self.viewController.navigationController pushViewController:vc animated:YES];
}
- (void)setLabelsArrM:(NSMutableArray *)labelsArrM {
    _labelsArrM = labelsArrM;
    [self.addressArrM removeAllObjects];
    if (labelsArrM.count > 0) {
        self.addButton.x = labelsArrM.count * 110;
        [self.labelsArrM enumerateObjectsUsingBlock:^(UIButton *button, NSUInteger idx, BOOL * _Nonnull stop) {
//            NSLog(@"新添加的Label.tag == %d",label.tag);
            button.x = 110 * idx;
            [self.addressArrM addObject:button.currentTitle];
        }];
    }
}
- (void)deleteAction:(UIButton *)button {
    UIButton *addressButton = (UIButton *)button.superview;
//    NSLog(@"要删除的Label.tag == %d",addressButton.tag);
    [addressButton removeFromSuperview];
    [self.labelsArrM removeObject:addressButton];
    [self setLabelsArrM:self.labelsArrM];
}
#pragma mark - SecondViewControllerDelegate
- (void)SecondViewController:(SecondViewController *)vc address:(NSString *)address {
//    NSLog(@"%@",self.labelsArrM);
//    NSLog(@"address == %@",address);
    if (address ) {
        UIButton *addressButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [addressButton addTarget:self action:@selector(changeAcion:) forControlEvents:UIControlEventTouchUpInside];
        [self.labelsArrM addObject:addressButton];
        addressButton.tag = count ;
        addressButton.size = CGSizeMake(100, 60);
        [addressButton setTitle:address forState:UIControlStateNormal];
        count ++;
        addressButton.backgroundColor = [UIColor redColor];
        
        [UIView animateWithDuration:.5 animations:^{
            self.addButton.x = self.labelsArrM.count * 110;
        }];
        [self addSubview:addressButton];
        
        UIButton *deleteButton = [UIButton buttonWithType:UIButtonTypeCustom];
        deleteButton.backgroundColor = [UIColor blueColor];
        deleteButton.frame = CGRectMake(0, 0, 30, 30);
        [deleteButton addTarget:self action:@selector(deleteAction:) forControlEvents:UIControlEventTouchUpInside];
        [addressButton addSubview:deleteButton];
        
        [self setLabelsArrM:self.labelsArrM];
        if (self.delegate && [self.delegate respondsToSelector:@selector(AddView:labels:)]) {
            [self.delegate AddView:self labels:self.addressArrM];
        }
    }
}
- (void)changeAcion:(UIButton *)button {
    SecondViewController *vc = [[SecondViewController alloc] init];
    NSLog(@"%@",self.labelsArrM);
   
//    NSLog(@"%d",button.tag);
    __weak __typeof(self) weakSelf = self;
    vc.addressBlock = ^(NSString *addressStr){
        
        for (UIButton *btn in self.labelsArrM) {
//            NSLog(@"%d",btn.tag);
            if (btn.tag == button.tag) {
                [weakSelf.addressArrM removeObject:button.currentTitle];
                [button setTitle:addressStr forState:UIControlStateNormal];
                [weakSelf.addressArrM addObject:button.currentTitle];
                NSLog(@"%@",weakSelf.addressArrM);
                if (self.delegate && [self.delegate respondsToSelector:@selector(AddView:labels:)]) {
                    [weakSelf.delegate AddView:weakSelf labels:weakSelf.addressArrM];
                }
            }
        }
    };
    [self.viewController.navigationController pushViewController:vc animated:YES];
}
@end
