//
//  UILabel+LXLabel.h
//  testTryCatch
//
//  Created by chuanglong02 on 16/7/15.
//  Copyright © 2016年 chuanglong02. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILabel (LXLabel)
+(UILabel *)LXLabelWithText:(NSString *)text textColor:(UIColor *)textColor backgroundColor:(UIColor *)backgroundColor frame:(CGRect)frame font:(UIFont *)font textAlignment:(NSTextAlignment)textAlignment;
+(UILabel *)LXLabelWithTextNoFrame:(NSString *)text textColor:(UIColor *)textColor backgroundColor:(UIColor *)backgroundColor font:(UIFont *)font textAlignment:(NSTextAlignment)textAlignment;
@end
