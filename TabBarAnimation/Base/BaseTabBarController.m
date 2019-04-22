
//
//  BaseTabBarController.m
//  TabBarAnimation
//
//  Created by 袁秘密 on 2019/4/19.
//  Copyright © 2019年 Yuanmimi. All rights reserved.
//

#import "BaseTabBarController.h"
#import "BaseNavigationController.h"
#import<AudioToolbox/AudioToolbox.h>


#import "FirstViewController.h"
#import "SecondViewController.h"
#import "ThirdViewController.h"
#import "FourViewController.h"

@interface BaseTabBarController ()<UITabBarControllerDelegate>

@property (nonatomic , assign) NSInteger lastIndex;

@property (nonatomic , strong) NSMutableArray *arr;

@end

@implementation BaseTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self initLayout];
}


#pragma mark ---- UITabBarControllerDelegate
- (void)tabBar:(UITabBar *)tabBar didSelectItem:(UITabBarItem *)item
{
    NSInteger index = [self.tabBar.items indexOfObject:item];
    if (index !=self.lastIndex)
    {
        /** 执行动画效果 **/
        NSMutableArray *array = [NSMutableArray array];
        for (UIView *btn in self.tabBar.subviews )
        {
            if ([btn isKindOfClass:NSClassFromString(@"UITabBarButton")])
            {
                for (UIView *view in btn.subviews)
                {
                    if ([view isKindOfClass:NSClassFromString(@"UITabBarSwappableImageView")])
                    {
                        [array addObject:view];
                    }
                }
            }
        }
        /** 添加动画 **/
        [self tabBarImageAnimationArr:array index:index number:2];
        
        //音效
        AudioServicesPlaySystemSound(1109);
        self.lastIndex = index;
    }
}

- (void)tabBarImageAnimationArr:(NSMutableArray *)arr index:(NSInteger)index number:(NSInteger)number
{
    if (number == 0)
    {
        //放大效果，并回到原位
        CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
        //速度控制函数，控制动画运行的节奏
        animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
        animation.duration = 0.2;       //执行时间
        animation.repeatCount = 1;      //执行次数
        animation.autoreverses = YES;    //完成动画后会回到执行动画之前的状态
        animation.fromValue = [NSNumber numberWithFloat:0.7];   //初始伸缩倍数
        animation.toValue = [NSNumber numberWithFloat:1.3];     //结束伸缩倍数
        [[arr[index] layer] addAnimation:animation forKey:nil];
    }else if (number == 1)
    {
        //z轴旋转180度（Z轴旋转）
        CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
        //速度控制函数，控制动画运行的节奏
        animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
        animation.duration = 0.2;       //执行时间
        animation.repeatCount = 1;      //执行次数
        animation.removedOnCompletion = YES;
        animation.fromValue = [NSNumber numberWithFloat:0];   //初始伸缩倍数
        animation.toValue = [NSNumber numberWithFloat:M_PI];     //结束伸缩倍数
        [[arr[index] layer] addAnimation:animation forKey:nil];
    }else if (number == 2)
    {
        //向上移动(Y轴位移)
        CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"transform.translation.y"];
        //速度控制函数，控制动画运行的节奏
        animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
        animation.duration = 0.2;       //执行时间
        animation.repeatCount = 1;      //执行次数
        animation.removedOnCompletion = YES;
        animation.fromValue = [NSNumber numberWithFloat:0];   //初始伸缩倍数
        animation.toValue = [NSNumber numberWithFloat:-10];     //结束伸缩倍数
        [[arr[index] layer] addAnimation:animation forKey:nil];
    }else if (number == 3)
    {
        //放大效果
        CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
        //速度控制函数，控制动画运行的节奏
        animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
        animation.duration = 0.2;       //执行时间
        animation.repeatCount = 1;      //执行次数
        animation.removedOnCompletion = NO;
        animation.fillMode = kCAFillModeForwards;           //保证动画效果延续
        animation.fromValue = [NSNumber numberWithFloat:1.0];   //初始伸缩倍数
        animation.toValue = [NSNumber numberWithFloat:1.15];     //结束伸缩倍数
        [[arr[index] layer] addAnimation:animation forKey:nil];
    }
}

- (void)initLayout
{
    
    [[UITabBarItem appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor grayColor],NSFontAttributeName:[UIFont systemFontOfSize:10]} forState:UIControlStateNormal];
    [[UITabBarItem appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor blackColor],NSFontAttributeName:[UIFont systemFontOfSize:10]} forState:UIControlStateSelected];
    
    FirstViewController *vc1 = [FirstViewController new];
    BaseNavigationController *nav1 = [self setupViewContoller:vc1 title:@"first" defaultImageName:@"1n" selectImageName:@"1s"];
    
    SecondViewController *vc2 = [SecondViewController new];
    BaseNavigationController *nav2 = [self setupViewContoller:vc2 title:@"second" defaultImageName:@"2n" selectImageName:@"2s"];
    
    ThirdViewController *vc3 = [ThirdViewController new];
    BaseNavigationController *nav3 = [self setupViewContoller:vc3 title:@"third" defaultImageName:@"3n" selectImageName:@"3s"];
    
    FourViewController *vc4 = [FourViewController new];
    BaseNavigationController *nav4 = [self setupViewContoller:vc4 title:@"four" defaultImageName:@"4n" selectImageName:@"4s"];
    
    NSArray *controllers = @[nav1,nav2,nav3,nav4];
    self.viewControllers = controllers;
    
}

- (BaseNavigationController *)setupViewContoller:(UIViewController *)vc title:(NSString *)title defaultImageName:(NSString *)defaultImageName selectImageName:(NSString *)selectImageName
{
    vc.title = title;
    UIImage *defaultImage = [UIImage imageNamed:defaultImageName];
    UIImage *selectImage = [UIImage imageNamed:selectImageName];
    vc.tabBarItem.image = [defaultImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    vc.tabBarItem.selectedImage = [selectImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    BaseNavigationController *nav = [[BaseNavigationController alloc] initWithRootViewController:vc];
    return nav;
}


@end
