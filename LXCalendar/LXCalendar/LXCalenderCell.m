//
//  LXCalenderCell.m
//  LXCalendar
//
//  Created by chenergou on 2017/11/2.
//  Copyright © 2017年 漫漫. All rights reserved.
//

#import "LXCalenderCell.h"
@interface LXCalenderCell()
@property (weak, nonatomic) IBOutlet UILabel *label;


@end
@implementation LXCalenderCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    
}
-(void)setModel:(LXCalendarDayModel *)model{
    _model = model;
    
    self.label.text = [NSString stringWithFormat:@"%ld",model.day];
    
    [self.label setFTCornerdious:0.0];
    self.label.backgroundColor = [UIColor whiteColor];
    
    if (model.isNextMonth || model.isLastMonth) {
        self.userInteractionEnabled = NO;
       
        if (model.isShowLastAndNextDate) {
            
            self.label.hidden = NO;
            if (model.isNextMonth) {
                self.label.textColor = model.nextMonthTitleColor? model.nextMonthTitleColor:[UIColor colorWithWhite:0.85 alpha:1.0];
            }
            
            if (model.isLastMonth) {
                self.label.textColor = model.lastMonthTitleColor? model.lastMonthTitleColor:[UIColor colorWithWhite:0.85 alpha:1.0];
            }

            
        }else{
            
            self.label.hidden = YES;
        }
        
        
    }else{
        
        self.label.hidden = NO;
        self.userInteractionEnabled = YES;
        
        
        if (model.isSelected) {
            [self.label setFTCornerdious:self.label.lx_width/2];
            self.label.backgroundColor = model.selectBackColor?model.selectBackColor:[UIColor greenColor];
            
            if (model.isHaveAnimation) {
                 [self addAnimaiton];
            }
           
        }
        self.label.textColor = model.currentMonthTitleColor?model.currentMonthTitleColor:[UIColor hexStringToColor:@"000000"];
        if (model.isToday) {
            self.label.textColor = model.todayTitleColor?model.todayTitleColor:[UIColor redColor];
        }
    }
    
}
-(void)addAnimaiton{
    CAKeyframeAnimation *anim = [CAKeyframeAnimation animation];
    
    
    anim.values = @[@0.6,@1.2,@1.0];
//    anim.fromValue = @0.6;
    anim.keyPath = @"transform.scale";  // transform.scale 表示长和宽都缩放
    anim.calculationMode = kCAAnimationPaced;
    anim.duration = 0.25;                // 设置动画执行时间
//    anim.repeatCount = MAXFLOAT;        // MAXFLOAT 表示动画执行次数为无限次
    
//    anim.autoreverses = YES;            // 控制动画反转 默认情况下动画从尺寸1到0的过程中是有动画的，但是从0到1的过程中是没有动画的，设置autoreverses属性可以让尺寸0到1也是有过程的
    
    [self.label.layer addAnimation:anim forKey:nil];
}
@end
