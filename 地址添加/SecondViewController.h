//
//  SecondViewController.h
//  地址添加
//
//  Created by Zhangguodong on 16/11/17.
//  Copyright © 2016年 ZGD. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void(^Block)(NSString *addressStr);
@class SecondViewController;
@protocol SecondViewControllerDelegate <NSObject>

- (void)SecondViewController:(SecondViewController *)vc address:(NSString *)address;

@end

@interface SecondViewController : UIViewController
/**
 *
 */
@property(nonatomic,weak)id<SecondViewControllerDelegate>delegate;
/**
 * block
 */
@property(nonatomic,copy)Block addressBlock;
@end
