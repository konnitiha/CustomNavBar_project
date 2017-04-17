//
//  BaseViewController.h
//  QinYueHui
//
//  Created by FuYunLei on 2017/3/30.
//  Copyright © 2017年 FuYunLei. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum : NSUInteger {
    NavColorWhite,
    NavColorBlue,
    NavColorPink,
    NavColorOrange,
} NavColor;

@interface BaseViewController : UIViewController

@property(nonatomic,strong)UIView *navView;
@property(nonatomic,assign)NavColor navColor;


/**
 添加自定义导航条

 @param color 导航条颜色-枚举值
 @param title title
 */
- (void)addNavViewWithColor:(NavColor)color andTitle:(NSString *)title;

/**
 设置title

 @param title title
 */
- (void)setTitle:(NSString *)title;


/**
 隐藏左边返回按钮
 */
- (void)hideLeftBtn;

/// 右边按钮  按钮1 tag 8  按钮2 tag 9
- (void)addRightBtnWithTitles:(NSArray *)titles target:(id)target selector:(SEL)sel;
/// 右边按钮  分享nav_share  收藏nav_favorite
- (void)addRightBtnWithImages:(NSArray *)images target:(id)target selector:(SEL)sel;

@end
