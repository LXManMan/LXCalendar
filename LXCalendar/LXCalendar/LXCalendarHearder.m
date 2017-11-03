//
//  LXCalendarHearder.m
//  LXCalendar
//
//  Created by chenergou on 2017/11/2.
//  Copyright © 2017年 漫漫. All rights reserved.
//

#import "LXCalendarHearder.h"
@interface LXCalendarHearder()
@property (weak, nonatomic) IBOutlet LxButton *leftBtn;
@property (weak, nonatomic) IBOutlet LxButton *rightBtn;
@property (weak, nonatomic) IBOutlet UILabel *dateLabel;
@end
@implementation LXCalendarHearder
-(void)setDateStr:(NSString *)dateStr{
    _dateStr = dateStr;
    
    self.dateLabel.text = dateStr;
}
-(void)awakeFromNib{
    [super awakeFromNib];
    
    self.leftBtn.enlargeSize  = self.rightBtn.enlargeSize = CGSizeMake(30, 30);
    
}
- (IBAction)leftClick:(LxButton *)sender {
    if (self.leftClickBlock) {
        self.leftClickBlock();
    }
}
- (IBAction)rightClick:(LxButton *)sender {
    
    if (self.rightClickBlock) {
        self.rightClickBlock();
    }
}
-(void)setIsShowLeftAndRightBtn:(BOOL)isShowLeftAndRightBtn{
    _isShowLeftAndRightBtn = isShowLeftAndRightBtn;
    self.leftBtn.hidden = self.rightBtn.hidden = !isShowLeftAndRightBtn;
}
-(void)hideLeftBtnAndRightBtn{
    self.leftBtn.hidden = self.rightBtn.hidden = YES;
}

+(LXCalendarHearder *)showView{
    return [[NSBundle mainBundle]loadNibNamed:@"LXCalendarHearder" owner:self options:nil].firstObject;
}
@end
