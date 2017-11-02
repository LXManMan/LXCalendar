//
//  LXCalendarHearder.h
//  LXCalendar
//
//  Created by chenergou on 2017/11/2.
//  Copyright © 2017年 漫漫. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^leftClickBlock) ();

typedef void (^rightClickBlock) ();

@interface LXCalendarHearder : UIView

@property(nonatomic,copy)leftClickBlock leftClickBlock;
@property(nonatomic,copy)rightClickBlock rightClickBlock;

+(LXCalendarHearder *)showView;

-(void)hideLeftBtnAndRightBtn;

@property(nonatomic,strong)NSString *dateStr;
@end
