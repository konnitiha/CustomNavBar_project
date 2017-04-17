//
//  TestViewController.m
//  QinYueHui
//
//  Created by FuYunLei on 2017/3/31.
//  Copyright © 2017年 FuYunLei. All rights reserved.
//

#import "TestViewController.h"

@interface TestViewController ()

@end

@implementation TestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self addNavViewWithColor:NavColorBlue andTitle:@"第二页"];
    [self addRightBtnWithTitles:@[@"返回"] target:self selector:@selector(rightBtnClick:)];
}
- (void)rightBtnClick:(UIButton *)btn{
     NSLog(@"tag = %zi",btn.tag);
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
