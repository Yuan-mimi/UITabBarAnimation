//
//  BaseNavigationController.m
//  TabBarAnimation
//
//  Created by 袁秘密 on 2019/4/19.
//  Copyright © 2019年 Yuanmimi. All rights reserved.
//

#import "BaseNavigationController.h"

@interface BaseNavigationController ()

@end

@implementation BaseNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [[UINavigationBar appearance] setTranslucent:NO];
    
    /** 自定义导航栏返回按钮时，处理手势返回失效问题 **/
    self.interactivePopGestureRecognizer.delegate = (id)self;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
