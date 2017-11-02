//
//  LXCalendarView.m
//  LXCalendar
//
//  Created by chenergou on 2017/11/2.
//  Copyright © 2017年 漫漫. All rights reserved.
//

#import "LXCalendarView.h"
#import "LXCalendarHearder.h"
#import "LXCalendarWeekView.h"
#import "LXCalenderCell.h"
#import "LXCalendarMonthModel.h"
#import "NSDate+GFCalendar.h"
@interface LXCalendarView()<UICollectionViewDelegate,UICollectionViewDataSource>
@property(nonatomic,strong)LXCalendarHearder *calendarHeader;
@property(nonatomic,strong)LXCalendarWeekView *calendarWeekView;
@property(nonatomic,strong)UICollectionView *collectionView;
@property(nonatomic,strong)NSMutableArray *monthdataA;
@property(nonatomic,strong)NSDate *currentMonthDate;

@end
@implementation LXCalendarView

-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        
        self.currentMonthDate = [NSDate date];

        
        [self setup];
        
        [self responData];
    }
    return self;
}
-(void)setup{
    [self addSubview:self.calendarHeader];
    
    WeakSelf(weakSelf);
    self.calendarHeader.leftClickBlock = ^{
        [weakSelf rightSlide];
    };
    
    self.calendarHeader.rightClickBlock = ^{
        [weakSelf leftSlide];

    };
    [self addSubview:self.calendarWeekView];
    
    [self addSubview:self.collectionView];
    
    self.lx_height = self.collectionView.lx_bottom;
    
    
    //添加左滑右滑手势
    UISwipeGestureRecognizer *leftSwipe =[[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(leftSwipe:)];
    leftSwipe.direction = UISwipeGestureRecognizerDirectionLeft;
    
    [self.collectionView addGestureRecognizer:leftSwipe];
    
    UISwipeGestureRecognizer *rightSwipe =[[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(rightSwipe:)];
    rightSwipe.direction = UISwipeGestureRecognizerDirectionRight;
    
    [self.collectionView addGestureRecognizer:rightSwipe];
}
#pragma mark --左滑手势--
-(void)leftSwipe:(UISwipeGestureRecognizer *)swipe{
    
    [self leftSlide];
}
#pragma mark --左滑处理--
-(void)leftSlide{
    self.currentMonthDate = [self.currentMonthDate nextMonthDate];
    
    [self performAnimations:kCATransitionFromRight];
    [self responData];
}
#pragma mark --右滑处理--
-(void)rightSlide{
    
    self.currentMonthDate = [self.currentMonthDate previousMonthDate];
    [self performAnimations:kCATransitionFromLeft];
    
    [self responData];
}
#pragma mark --右滑手势--
-(void)rightSwipe:(UISwipeGestureRecognizer *)swipe{
   
    [self rightSlide];
}
#pragma mark--动画处理--
- (void)performAnimations:(NSString *)transition{
    CATransition *catransition = [CATransition animation];
    catransition.duration = 0.5;
    [catransition setTimingFunction:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear]];
    catransition.type = kCATransitionPush; //choose your animation
    catransition.subtype = transition;
    [self.collectionView.layer addAnimation:catransition forKey:nil];
}

#pragma mark--数据以及更新处理--
-(void)responData{
    
    [self.monthdataA removeAllObjects];
    
    NSDate *previousMonthDate = [self.currentMonthDate previousMonthDate];
    
    [self.monthdataA addObject:[[LXCalendarMonthModel alloc] initWithDate:previousMonthDate]];
    NSDate *nextMonthDate = [self.currentMonthDate  nextMonthDate];
   
    LXCalendarMonthModel *model = [[LXCalendarMonthModel alloc]initWithDate:self.currentMonthDate];
    [self.monthdataA addObject:model];
    
    [self.monthdataA addObject:[[LXCalendarMonthModel alloc] initWithDate:nextMonthDate]];

    self.calendarHeader.dateStr = [NSString stringWithFormat:@"%ld年%ld月",model.year,model.month];
    [self.collectionView reloadData];
    
}
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 35;
}
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *cellIndentifier = @"cell";
    LXCalenderCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellIndentifier forIndexPath:indexPath];
    if (!cell) {
        cell =[[LXCalenderCell alloc]init];
        
    }
    
    LXCalendarMonthModel *monthModdel = self.monthdataA[1];
    
    NSInteger firstWeekday = monthModdel.firstWeekday;
    NSInteger totalDays = monthModdel.totalDays;
    // 当前月
    if (indexPath.row >= firstWeekday && indexPath.row < firstWeekday + totalDays) {
        cell.label.text = [NSString stringWithFormat:@"%ld", indexPath.row - firstWeekday + 1];
        cell.label.textColor = [UIColor darkTextColor];
        cell.userInteractionEnabled = YES;
        
        // 标识今天
        if ((monthModdel.month == [[NSDate date] dateMonth]) && (monthModdel.year == [[NSDate date] dateYear])) {
            if (indexPath.row == [[NSDate date] dateDay] + firstWeekday - 1) {

                cell.label.textColor = [UIColor redColor];
            } else {

            }
        } else {
        }
        
    }
    // 补上前后月的日期，淡色显示
    else if (indexPath.row < firstWeekday) {
        LXCalendarMonthModel *lastMonthInfo = self.monthdataA[0];
        NSInteger totalDaysOflastMonth = lastMonthInfo.totalDays;
        cell.label.text = [NSString stringWithFormat:@"%ld", totalDaysOflastMonth - (firstWeekday - indexPath.row) + 1];
        cell.label.textColor = [UIColor colorWithWhite:0.85 alpha:1.0];
        cell.userInteractionEnabled = NO;
    } else if (indexPath.row >= firstWeekday + totalDays) {
        cell.label.text = [NSString stringWithFormat:@"%ld", indexPath.row - firstWeekday - totalDays + 1];
        cell.label.textColor = [UIColor colorWithWhite:0.85 alpha:1.0];
        cell.userInteractionEnabled = NO;
    }


    cell.backgroundColor =[UIColor whiteColor];
    
    return cell;
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
   
    
}
-(void)layoutSubviews{
    [super layoutSubviews];
    self.calendarHeader.frame = CGRectMake(0, 0, self.lx_width, 50);
}
#pragma mark---懒加载
-(LXCalendarHearder *)calendarHeader{
    if (!_calendarHeader) {
        _calendarHeader =[LXCalendarHearder showView];
        _calendarHeader.frame = CGRectMake(0, 0, self.lx_width, 50);
        _calendarHeader.backgroundColor =[UIColor whiteColor];
    }
    return _calendarHeader;
}
-(LXCalendarWeekView *)calendarWeekView{
    if (!_calendarWeekView) {
        _calendarWeekView =[[LXCalendarWeekView alloc]initWithFrame:CGRectMake(0, self.calendarHeader.lx_bottom, self.lx_width, 50)];
        _calendarWeekView.weekTitles = @[@"周日",@"周一",@"周二",@"周三",@"周四",@"周五",@"周六"];
    }
    return _calendarWeekView;
}
-(UICollectionView *)collectionView{
    if (!_collectionView) {
        
        
        UICollectionViewFlowLayout *flow =[[UICollectionViewFlowLayout alloc]init];
        //325*403
        flow.minimumInteritemSpacing = 0;
        flow.minimumLineSpacing = 0;
        flow.sectionInset =UIEdgeInsetsMake(0 , 0, 0, 0);
        
        flow.itemSize = CGSizeMake(self.lx_width/7, 50);
        _collectionView =[[UICollectionView alloc]initWithFrame:CGRectMake(0, self.calendarWeekView.lx_bottom, self.lx_width, 6 * 50) collectionViewLayout:flow];
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        _collectionView.showsVerticalScrollIndicator = NO;
        _collectionView.showsHorizontalScrollIndicator = NO;
        _collectionView.scrollsToTop = YES;
        _collectionView.backgroundColor = [UIColor whiteColor];
        UINib *nib = [UINib nibWithNibName:@"LXCalenderCell" bundle:nil];
        [_collectionView registerNib:nib forCellWithReuseIdentifier:@"cell"];
        
        
    }
    return _collectionView;
}
-(NSMutableArray *)monthdataA{
    if (!_monthdataA) {
        _monthdataA =[NSMutableArray array];
    }
    return _monthdataA;
}
@end
