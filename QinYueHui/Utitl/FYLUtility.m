//
//  FYLUtility.m
//  XiangParkingNew
//
//  Created by eparking2 on 15/11/16.
//  Copyright © 2015年 eparking. All rights reserved.
//

#import "FYLUtility.h"
#import "MBProgressHUD.h"

@implementation FYLUtility

//创建label
 +(UILabel *)createLabelWithTitle:(NSString *)title fontSize:(CGFloat )fontSize
{
   return  [self createLabelWithFrame:CGRectMake(0, 0, 0, 0) title:title font:[UIFont fontWithName:@"PingFang SC" size:fontSize] textColor:[UIColor blackColor] bgColor:nil];
}
+ (UILabel *)createLabelWithFrame:(CGRect)frame title:(NSString *)title font:(UIFont *)font textColor:(UIColor *)textColor bgColor:(UIColor *)bgColor
{
   return [self createLabelWithFrame:frame title:title font:font textColor:textColor bgColor:bgColor textAlignment:NSTextAlignmentCenter numberOfLines:0];
}
+ (UILabel *)createLabelWithFrame:(CGRect)frame title:(NSString *)title font:(UIFont *)font textColor:(UIColor *)textColor bgColor:(UIColor *)bgColor textAlignment:(NSTextAlignment)textAlignment numberOfLines:(NSInteger)numberOfLines
{
    UILabel *label = [[UILabel alloc] initWithFrame:frame];
    label.textAlignment = textAlignment;
    if (font) {
        [label setFont:font];
    }
    if (textColor) {
        label.textColor = textColor;
    }
    if (bgColor) {
        label.backgroundColor = bgColor;
    }
    if (title) {
         label.text = title;
    }
    label.numberOfLines = numberOfLines;
    return label;
}
//创建button
+ (UIButton *)createButtonWithFrame:(CGRect)frame bgColor:(UIColor *)bgColor title:(NSString *)title titleColor:(UIColor *)titleColor font:(UIFont *)font image:(UIImage *)image target:(id)target sel:(SEL)action tag:(NSInteger)tag
{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setFrame:frame];
    if (bgColor) {
        [btn setBackgroundColor:bgColor];
    }
    if (title) {
        [btn setTitle:title forState:UIControlStateNormal];
    }
    if (titleColor) {
        [btn setTitleColor:titleColor forState:UIControlStateNormal];
    }
    if (image) {
        [btn setBackgroundImage:image forState:UIControlStateNormal];
       
    }
    if (font) {
        [btn.titleLabel setFont:font];
    }
    
    [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    [btn setTag:tag];
    return btn;
}
+(UIButton *)createButtonWithFrame:(CGRect)frame image:(UIImage *)image target:(id)target sel:(SEL)action tag:(NSInteger)tag
{
    return [self createButtonWithFrame:frame bgColor:nil title:nil titleColor:nil font:nil image:image target:target sel:action tag:tag];
}

//保存数据到本地
+(void)saveLocalData:(id)obj forKey:(NSString *)key
{
    NSData *data = [NSKeyedArchiver archivedDataWithRootObject:obj];
    [[NSUserDefaults standardUserDefaults] setObject:data forKey:key];
    [[NSUserDefaults standardUserDefaults] synchronize];
    
}
//移除本地数据
+(void)removeLocalData:(NSString *)key
{
    [[NSUserDefaults standardUserDefaults]removeObjectForKey:key];
    [[NSUserDefaults standardUserDefaults]synchronize];
    
}
//获取本地数据
+(id)getLocalData:(NSString *)key
{
    NSData *data = [[NSUserDefaults standardUserDefaults]objectForKey:key];
    return [NSKeyedUnarchiver unarchiveObjectWithData:data];
}


//MD5
+ (NSString *)md5:(NSString *)input
{
    const char *cStr = [input UTF8String];
    unsigned char digest[CC_MD5_DIGEST_LENGTH];
    CC_MD5( cStr, (CC_LONG)strlen(cStr), digest ); // This is the md5 call
    
    NSMutableString *output = [NSMutableString stringWithCapacity:CC_MD5_DIGEST_LENGTH * 2];
    
    for(int i = 0; i < CC_MD5_DIGEST_LENGTH; i++)
    {
        
        [output appendFormat:@"%02x", digest[i]];
    }
    
    return  output;
}

+ (NSString *)strDeleteZeroAtEnd:(NSString *)str
{
    if (![str containsString:@"."]) {
        return str;
    }
    
    NSMutableString *strMut = [NSMutableString stringWithString:str];
    
    while (strMut.length) {
        unichar ch = [strMut characterAtIndex:strMut.length-1];
        if (ch == '0') {
            [strMut deleteCharactersInRange:NSMakeRange(strMut.length - 1, 1)];
            continue;
        }
        if (ch == '.') {
            [strMut deleteCharactersInRange:NSMakeRange(strMut.length - 1, 1)];
            break;
        }else
        {
            break;
        }
    }
    return strMut;
}

+ (NSString *)doubleDeleteZeroAtEnd:(double)f
{
    NSMutableString *strMut = [NSMutableString stringWithString:[NSString stringWithFormat:@"%.2f",f]];
    while (strMut.length) {
        unichar ch = [strMut characterAtIndex:strMut.length-1];
        if (ch == '0') {
            [strMut deleteCharactersInRange:NSMakeRange(strMut.length - 1, 1)];
            continue;
        }
        if (ch == '.') {
            [strMut deleteCharactersInRange:NSMakeRange(strMut.length - 1, 1)];
            break;
        }else
        {
            break;
        }
    }
    return strMut;
}

+ (NSString *)strToDateStr:(NSString *)str
{
    NSInteger time = [str integerValue]/1000;
    
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:time];
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"YYYY-MM-dd HH:mm"];
    return [formatter stringFromDate:date];
    
}


+ (UIViewController *)topViewController {
    UIViewController *resultVC;
    resultVC = [self _topViewController:[[UIApplication sharedApplication].keyWindow rootViewController]];
    while (resultVC.presentedViewController) {
        resultVC = [self _topViewController:resultVC.presentedViewController];
    }
    return resultVC;
}

+ (UIViewController *)_topViewController:(UIViewController *)vc {
    if ([vc isKindOfClass:[UINavigationController class]]) {
        return [self _topViewController:[(UINavigationController *)vc topViewController]];
    } else if ([vc isKindOfClass:[UITabBarController class]]) {
        return [self _topViewController:[(UITabBarController *)vc selectedViewController]];
    } else {
        return vc;
    }
    return nil;
}

+ (void)showMBProgressWithTitle:(NSString *)title ToView:(UIView *)view autoHideWithAfterSecond:(float)second {
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    hud.mode = MBProgressHUDModeText;
    hud.label.text = title;
    hud.label.textColor = [UIColor whiteColor];
    hud.bezelView.backgroundColor = [UIColor blackColor];
    if (second) {
        [hud hideAnimated:YES afterDelay:second];
    }
}

@end



