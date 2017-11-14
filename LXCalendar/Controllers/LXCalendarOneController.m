//
//  LXCalendarOneController.m
//  LXCalendar
//
//  Created by chenergou on 2017/11/3.
//  Copyright © 2017年 漫漫. All rights reserved.
//

#import "LXCalendarOneController.h"
#import "LXCalender.h"
@interface LXCalendarOneController ()
@property(nonatomic,strong)LXCalendarView *calenderView;

@end

@implementation LXCalendarOneController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor =[UIColor whiteColor];
    
    self.title = @"滑动切换";
    self.calenderView =[[LXCalendarView alloc]initWithFrame:CGRectMake(20, 80, Device_Width - 40, 0)];
    
    self.calenderView.currentMonthTitleColor =[UIColor hexStringToColor:@"2c2c2c"];
    self.calenderView.lastMonthTitleColor =[UIColor hexStringToColor:@"8a8a8a"];
    self.calenderView.nextMonthTitleColor =[UIColor hexStringToColor:@"8a8a8a"];
    
    self.calenderView.isHaveAnimation = NO;
    
    
    
    self.calenderView.isCanScroll = YES;
    self.calenderView.isShowLastAndNextBtn = NO;
    
    self.calenderView.isShowLastAndNextDate = YES;

    self.calenderView.todayTitleColor =[UIColor redColor];
    
    self.calenderView.selectBackColor =[UIColor greenColor];
    
    [self.calenderView dealData];
    
    self.calenderView.backgroundColor =[UIColor whiteColor];
    [self.view addSubview:self.calenderView];
    
    self.calenderView.selectBlock = ^(NSInteger year, NSInteger month, NSInteger day) {
        NSLog(@"%ld年 - %ld月 - %ld日",year,month,day);
        NSString *string =[NSString stringWithFormat:@"%ld-%ld-%ld",year,month,day];
        NSDate *date =[NSString dateFromTimeStr:string];
        NSLog(@"%@",date);
    };
    
    NSLog(@"%@",[NSString getNowTime]);
    
    NSDate *date =[NSString dateFromTimeStr:[NSString getNowTime]];
    NSLog(@"%@",date);

}



@end
