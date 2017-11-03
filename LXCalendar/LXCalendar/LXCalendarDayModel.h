//
//  LXCalendarDayModel.h
//  LXCalendar
//
//  Created by chenergou on 2017/11/3.
//  Copyright © 2017年 漫漫. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LXCalendarDayModel : NSObject
@property (nonatomic, assign) NSInteger totalDays; //!< 当前月的天数
@property (nonatomic, assign) NSInteger firstWeekday; //!< 标示第一天是星期几（0代表周日，1代表周一，以此类推）
@property (nonatomic, assign) NSInteger year; //!< 所属年份
@property (nonatomic, assign) NSInteger month; //!< 当前月份
@property (nonatomic, assign) NSInteger day;   //每天所在的位置

@property(nonatomic,assign)BOOL isLastMonth;//属于上个月的
@property(nonatomic,assign)BOOL isNextMonth;//属于下个月的
@property(nonatomic,assign)BOOL isCurrentMonth;//属于当月

@property(nonatomic,assign)BOOL isToday;//今天

@property(nonatomic,assign)BOOL isSelected;//是否被选中



/*
 * 当前月的title颜色
 */
@property(nonatomic,strong)UIColor *currentMonthTitleColor;
/*
 * 上月的title颜色
 */
@property(nonatomic,strong)UIColor *lastMonthTitleColor;
/*
 * 下月的title颜色
 */
@property(nonatomic,strong)UIColor *nextMonthTitleColor;

/*
 * 选中的背景颜色
 */
@property(nonatomic,strong)UIColor *selectBackColor;

/*
 * 今日的title颜色
 */
@property(nonatomic,strong)UIColor *todayTitleColor;

/*
 * 是否显示上月，下月的的数据
 */
@property(nonatomic,assign)BOOL     isShowLastAndNextDate;
/*
 * 选中的是否动画效果
 */
@property(nonatomic,assign)BOOL     isHaveAnimation;
@end
