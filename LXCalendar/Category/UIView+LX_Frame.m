//
//  UIView+LX_Frame.m
//  AliPayHome
//
//  Created by chenergou on 2017/10/31.
//  Copyright © 2017年 漫漫. All rights reserved.
//

#import "UIView+LX_Frame.h"

@implementation UIView (LX_Frame)
-(void)setLx_x:(CGFloat)lx_x{
        CGFloat y = self.frame.origin.y;
        CGFloat width = self.frame.size.width;
        CGFloat height = self.frame.size.height;
        self.frame = CGRectMake(lx_x, y, width, height);
}
-(CGFloat)lx_x{
    return self.frame.origin.x;
}
-(void)setLx_y:(CGFloat)lx_y{
    CGFloat x = self.frame.origin.x;
    CGFloat width = self.frame.size.width;
    CGFloat height = self.frame.size.height;
    self.frame = CGRectMake(x, lx_y, width, height);
}
-(CGFloat)lx_y{
    return self.frame.origin.y;
}
-(void)setLx_width:(CGFloat)lx_width{
    CGRect frame = self.frame;
    frame.size.width = lx_width;
    self.frame = frame;
}
-(CGFloat)lx_width{
    return self.frame.size.width;
}

-(void)setLx_height:(CGFloat)lx_height{
    CGRect frame = self.frame;
    frame.size.height = lx_height;
    self.frame = frame;
}

-(CGFloat)lx_height{
    return self.frame.size.height;
}


-(void)setLx_left:(CGFloat)lx_left{
    CGFloat y = self.frame.origin.y;
    CGFloat width = self.frame.size.width;
    CGFloat height = self.frame.size.height;
    self.frame = CGRectMake(lx_left, y, width, height);
}
-(CGFloat)lx_left{
    return self.frame.origin.x;
}


-(void)setLx_top:(CGFloat)lx_top{
    CGFloat x = self.frame.origin.x;
    CGFloat width = self.frame.size.width;
    CGFloat height = self.frame.size.height;
    self.frame = CGRectMake(x, lx_top, width, height);
}
-(CGFloat)lx_top{
    return self.frame.origin.y;
}
-(void)setLx_right:(CGFloat)lx_right{
    CGRect frame = self.frame;
    frame.origin.x = lx_right - frame.size.width;
    self.frame = frame;
}
-(CGFloat)lx_right{
    return self.frame.origin.x + self.frame.size.width;
}
-(void)setLx_bottom:(CGFloat)lx_bottom{
    CGRect frame = self.frame;
    frame.origin.y = lx_bottom - frame.size.height;
    self.frame = frame;
}
-(CGFloat)lx_bottom{
     return self.frame.origin.y + self.frame.size.height;
}

-(CGSize)lx_size {
    return self.frame.size;
}

- (void)setLx_size:(CGSize)lx_size {
    CGRect frame = self.frame;
    frame.size = lx_size;
    self.frame = frame;
}
@end
