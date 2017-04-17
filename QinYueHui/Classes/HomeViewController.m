//
//  HomeViewController.m
//  QinYueHui
//
//  Created by FuYunLei on 2017/3/30.
//  Copyright © 2017年 FuYunLei. All rights reserved.
//

#import "HomeViewController.h"

@interface HomeViewController ()

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self addNavViewWithColor:NavColorWhite andTitle:@"首页"];
    [self hideLeftBtn];
    [self addRightBtnWithTitles:@[@"订购",@"跳转"] target:self selector:@selector(rightBtnClick:)];
    
}

- (void)rightBtnClick:(UIButton *)btn{
    NSLog(@"%@",btn.currentTitle);
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
