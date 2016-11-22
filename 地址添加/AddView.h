//
//  AddView.h
//  地址添加
//
//  Created by Zhangguodong on 16/11/17.
//  Copyright © 2016年 ZGD. All rights reserved.
//

#import <UIKit/UIKit.h>
@class AddView;
@protocol AddViewDelegate <NSObject>

- (void)AddView:(AddView *)addView labels:(NSMutableArray *)arr;

@end

@interface AddView : UIView
/**
 * 代理
 */
@property(nonatomic,weak)id<AddViewDelegate>delegate;
/**
 * 数组
 */
@property(nonatomic,strong)NSMutableArray *labelsArrM;
@end
