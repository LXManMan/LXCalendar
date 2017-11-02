
//
//  NextController.m
//  LXCalendar
//
//  Created by chenergou on 2017/11/2.
//  Copyright © 2017年 漫漫. All rights reserved.
//

#import "NextController.h"
#import "LXCalender.h"
@interface NextController ()
@property(nonatomic,strong)LXCalendarView *calenderView;
@end

@implementation NextController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor =[UIColor whiteColor];
    self.calenderView =[[LXCalendarView alloc]initWithFrame:CGRectMake(20, 80, Device_Width - 40, 0)];
    self.calenderView.backgroundColor =[UIColor whiteColor];
    [self.view addSubview:self.calenderView];
}



@end
