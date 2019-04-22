//
//  BaseViewController.m
//  TabBarAnimation
//
//  Created by 袁秘密 on 2019/4/19.
//  Copyright © 2019年 Yuanmimi. All rights reserved.
//

#import "BaseViewController.h"

@interface BaseViewController ()

@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];
    [self initNav];
}

- (void)initNav
{
    self.leftBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 44, 44)];
    [self.leftBtn setImage:[UIImage imageNamed:@""] forState:UIControlStateNormal];
    [self.leftBtn setImage:[UIImage imageNamed:@""] forState:UIControlStateSelected];
    [self.leftBtn addTarget:self action:@selector(leftBtnAction:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *leftItem = [[UIBarButtonItem alloc] initWithCustomView:self.leftBtn];
    self.navigationItem.leftBarButtonItem = leftItem;
    
    
    self.rightBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 44, 44)];
    [self.rightBtn setImage:[UIImage imageNamed:@""] forState:UIControlStateNormal];
    [self.rightBtn setImage:[UIImage imageNamed:@""] forState:UIControlStateSelected];
    [self.rightBtn addTarget:self action:@selector(rightBtnAction:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc] initWithCustomView:self.rightBtn];
    self.navigationItem.leftBarButtonItem = rightItem;
}


#pragma mark ------ UIButton Action
- (void)leftBtnAction:(UIButton *)btn
{
    [self.navigationController dismissViewControllerAnimated:YES completion:nil];
}

- (void)rightBtnAction:(UIButton *)btn
{
    /** do anything **/
}
@end
