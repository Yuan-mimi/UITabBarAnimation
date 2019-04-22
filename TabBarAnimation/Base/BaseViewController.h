//
//  BaseViewController.h
//  TabBarAnimation
//
//  Created by 袁秘密 on 2019/4/19.
//  Copyright © 2019年 Yuanmimi. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface BaseViewController : UIViewController

/** 左侧按钮 **/
@property (nonatomic , strong) UIButton *leftBtn;

/** 右侧按钮 **/
@property (nonatomic , strong) UIButton *rightBtn;


#pragma mark ------ left Action
- (void)leftBtnAction:(UIButton *)btn;

#pragma mark ------right Action
- (void)rightBtnAction:(UIButton *)btn;

@end

NS_ASSUME_NONNULL_END
