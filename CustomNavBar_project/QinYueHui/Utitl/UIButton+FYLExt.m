//
//  UIButton+FYLExt.m
//  BATP
//
//  Created by eparking2 on 16/5/3.
//  Copyright © 2016年 eparking. All rights reserved.
//

#import "UIButton+FYLExt.h"

@implementation UIButton (FYLExt)

- (void)setBackgroundImageWithColor:(UIColor *)color forState:(UIControlState)state
{
    CGRect rect = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    UIImage *img = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();

    [self setBackgroundImage:img forState:state];
}

- (void)setFontSize:(CGFloat)fontSize
{
    if (SCREEN_WIDTH == 320) {
        
        [self.titleLabel setFont:kTextFont(10)];

    }else
    {
        [self.titleLabel setFont:kTextFont(30)];
    }
}

- (CGFloat)fontSize
{
    return 17;
}

@end
