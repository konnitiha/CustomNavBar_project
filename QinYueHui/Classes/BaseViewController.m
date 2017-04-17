//
//  BaseViewController.m
//  QinYueHui
//
//  Created by FuYunLei on 2017/3/30.
//  Copyright © 2017年 FuYunLei. All rights reserved.
//

#import "BaseViewController.h"

@interface BaseViewController ()

@property(nonatomic,strong)UIImageView *bgImageView;
@property(nonatomic,strong)UIButton *backBtn;
@property(nonatomic,strong)UILabel *titleLabel;


@property(nonatomic,strong)UIButton *rightBtn1;
@property(nonatomic,strong)UIButton *rightBtn2;

@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self.navigationController setNavigationBarHidden:YES animated:NO];
}

#pragma mark - 添加导航条
- (void)addNavViewWithColor:(NavColor)color andTitle:(NSString *)title{
    
    self.navView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 64)];
    [self.view addSubview:self.navView];
    
    self.bgImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 64)];
    [self.navView addSubview:self.bgImageView];
    
    self.backBtn = [[UIButton alloc] initWithFrame:CGRectMake(10, 20, 45, 44)];
    self.backBtn.imageEdgeInsets = UIEdgeInsetsMake(0, -20, 0, 0);
    [self.backBtn addTarget:self action:@selector(backAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.navView addSubview:self.backBtn];
    
    self.titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(SCREEN_WIDTH/2 - 100, 20, 200, 44)];
    self.titleLabel.textAlignment = NSTextAlignmentCenter;
    self.titleLabel.font = kTextFont(18);
    self.titleLabel.text = title;
    [self.navView addSubview:self.titleLabel];
    
    self.navColor = color;
    
}

#pragma mark - 设置导航条样式
- (void)setNavColor:(NavColor)navColor
{
    _navColor = navColor;
    
    NSArray *backBtnImages = @[@"back_gray",@"back_white",@"back_white",@"back_white"];
    NSArray *bgImages = @[@"white_top",@"blue_top",@"pink_top",@"orange_top"];
    NSArray *titleColors = @[kCOLORWITHHEX(0x87BEF5),[UIColor whiteColor],[UIColor whiteColor],[UIColor whiteColor]];
    NSArray *rightBtnColors = @[kCOLORWITHHEX(0xB6BBC2),[UIColor whiteColor],[UIColor whiteColor],[UIColor whiteColor]];
    
    [self.backBtn setImage:[UIImage imageNamed:backBtnImages[_navColor]] forState:UIControlStateNormal];
    [self.bgImageView setImage:[UIImage imageNamed:bgImages[_navColor]]];
    self.titleLabel.textColor = titleColors[_navColor];
    
    [self.rightBtn1 setTitleColor:rightBtnColors[_navColor] forState:UIControlStateNormal];
    [self.rightBtn2 setTitleColor:rightBtnColors[_navColor] forState:UIControlStateNormal];
    
    /*改为用上面的方法
    switch (_navColor) {
        case NavColorWhite:
        {
            [self.backBtn setImage:[UIImage imageNamed:@"back_gray"] forState:UIControlStateNormal];
            [self.bgImageView setImage:[UIImage imageNamed:@"white_top"]];
            self.titleLabel.textColor = kCOLORWITHHEX(0x87BEF5);
            
            [self.rightBtn1 setTitleColor:kCOLORWITHHEX(0xB6BBC2) forState:UIControlStateNormal];
            [self.rightBtn2 setTitleColor:kCOLORWITHHEX(0xB6BBC2) forState:UIControlStateNormal];
           
        }
            break;
            
        case NavColorBlue:
        {
            [self.backBtn setImage:[UIImage imageNamed:@"back_white"] forState:UIControlStateNormal];
            [self.bgImageView setImage:[UIImage imageNamed:@"blue_top"]];
            self.titleLabel.textColor = [UIColor whiteColor];
            
            [self.rightBtn1 setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
            [self.rightBtn2 setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        }
            break;
        case NavColorOrange:
        {
            [self.backBtn setImage:[UIImage imageNamed:@"back_white"] forState:UIControlStateNormal];
            [self.bgImageView setImage:[UIImage imageNamed:@"orange_top"]];
            self.titleLabel.textColor = [UIColor whiteColor];
            
            [self.rightBtn1 setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
            [self.rightBtn2 setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        }
            break;
        case NavColorPink:
        {
            [self.backBtn setImage:[UIImage imageNamed:@"back_white"] forState:UIControlStateNormal];
            [self.bgImageView setImage:[UIImage imageNamed:@"pink_top"]];
            self.titleLabel.textColor = [UIColor whiteColor];
            
            [self.rightBtn1 setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
            [self.rightBtn2 setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        }
            break;
            
        default:
            break;
    }
     */
    
}
#pragma mark - 隐藏左边返回按钮
- (void)hideLeftBtn{
    self.backBtn.hidden = YES;
}
#pragma mark - 设置标题
- (void)setTitle:(NSString *)title{
    self.titleLabel.text = title;
}
#pragma mark - 添加右边标题或者图片按钮

- (void)addRightBtnWithTitles:(NSArray *)titles target:(id)target selector:(SEL)sel{
    
    [self addRightBtnWithArr:titles target:target selector:sel isTitle:YES];
}
- (void)addRightBtnWithImages:(NSArray *)images target:(id)target selector:(SEL)sel
{
    [self addRightBtnWithArr:images target:target selector:sel isTitle:NO];
}
#pragma mark - 左边返回按钮点击事件
- (void)backAction:(UIButton *)btn{
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark - tool

- (void)addRightBtnWithArr:(NSArray *)titles target:(id)target selector:(SEL)sel isTitle:(BOOL)isTitle{
    if (titles.count == 1) {
        
        self.rightBtn1 = [[UIButton alloc] initWithFrame:CGRectMake(SCREEN_WIDTH-40, 20, 40, 44)];
        [self.rightBtn1.titleLabel setFont:kTextFont(14)];
        [self.rightBtn1 addTarget:target action:sel forControlEvents:UIControlEventTouchUpInside];
        self.rightBtn1.tag = 8;
        [self.navView addSubview:self.rightBtn1];
        
    }else{
        
        self.rightBtn1 = [[UIButton alloc] initWithFrame:CGRectMake(SCREEN_WIDTH-80, 20, 40, 44)];
        [self.rightBtn1 setTitle:[titles firstObject] forState:UIControlStateNormal];
        [self.rightBtn1.titleLabel setFont:kTextFont(14)];
        [self.rightBtn1 addTarget:target action:sel forControlEvents:UIControlEventTouchUpInside];
        self.rightBtn1.tag = 8;
        [self.navView addSubview:self.rightBtn1];
        
        self.rightBtn2 = [[UIButton alloc] initWithFrame:CGRectMake(SCREEN_WIDTH-40, 20, 40, 44)];
        [self.rightBtn2 setTitle:[titles lastObject] forState:UIControlStateNormal];
        [self.rightBtn2.titleLabel setFont:kTextFont(14)];
        [self.rightBtn2 addTarget:target action:sel forControlEvents:UIControlEventTouchUpInside];
        self.rightBtn2.tag = 9;
        [self.navView addSubview:self.rightBtn2];
        
    }
    
    if (isTitle) {
        [self.rightBtn1 setTitle:[titles firstObject] forState:UIControlStateNormal];
        [self.rightBtn2 setTitle:[titles lastObject] forState:UIControlStateNormal];
        [self setNavColor:self.navColor];
    }else
    {
        [self.rightBtn1 setImage:[UIImage imageNamed:[titles firstObject]] forState:UIControlStateNormal];
        [self.rightBtn2 setImage:[UIImage imageNamed:[titles lastObject]] forState:UIControlStateNormal];
    }
   
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
