//
//  LxButton.m
//  ButtonBlock
//
//  Created by chuanglong02 on 16/8/4.
//  Copyright © 2016年 chuanglong02. All rights reserved.
//

#import "LxButton.h"

@implementation LxButton
+(LxButton *)LXButtonWithTitle:(NSString *)title titleFont:(UIFont *)titleLabelFont Image:(UIImage *)image backgroundImage:(UIImage *)backgroundImage backgroundColor:(UIColor *)backgroundColor titleColor:(UIColor *)titleLabelColor frame:(CGRect)frame
{
    LxButton *button = [LxButton buttonWithType:UIButtonTypeCustom];
    [button setImage:image forState:UIControlStateNormal];
    [button setBackgroundImage:backgroundImage forState:UIControlStateNormal];
    [button setTitle:title forState:UIControlStateNormal];
    [button setTitleColor:titleLabelColor forState:UIControlStateNormal];
    button.backgroundColor = backgroundColor;
    button.frame = frame;
    button.titleLabel.font = titleLabelFont;
    return button;
}
+(LxButton *)LXButtonNoFrameWithTitle:(NSString *)title titleFont:(UIFont *)titleLabelFont Image:(UIImage *)image backgroundImage:(UIImage *)backgroundImage backgroundColor:(UIColor *)backgroundColor titleColor:(UIColor *)titleLabelColor
{
    LxButton *button = [LxButton buttonWithType:UIButtonTypeCustom];
    [button setImage:image forState:UIControlStateNormal];
    [button setBackgroundImage:backgroundImage forState:UIControlStateNormal];
    [button setTitle:title forState:UIControlStateNormal];
    [button setTitleColor:titleLabelColor forState:UIControlStateNormal];
    button.backgroundColor = backgroundColor;
    button.titleLabel.font = titleLabelFont;
    return button;
}

-(void)addClickBlock:(ButtonBlock)block
{
    _block = block;
    [self addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
}
-(void)buttonAction:(UIButton *)button
{
    _block(button);
}
-(void)setButtonID:(NSInteger)buttonID
{
    _buttonID = buttonID;
    self.tag = buttonID;
}

-(void)setEnlargeSize:(CGSize)enlargeSize{
    _enlargeSize = enlargeSize;
}
-(BOOL)pointInside:(CGPoint)point withEvent:(UIEvent*)event
{
    CGRect bounds = self.bounds;
    //扩大原热区直径至26，可以暴露个接口，用来设置需要扩大的半径。
    
    CGFloat widthDelta = MAX(self.enlargeSize.width , 0);
    CGFloat heightDelta = MAX(self.enlargeSize.height, 0);
    bounds = CGRectInset(bounds, -0.5 * widthDelta, -0.5 * heightDelta);
    return CGRectContainsPoint(bounds, point);
}

@end
