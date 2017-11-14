//
//  NSString+NCDate.m
//  NatureCard
//
//  Created by zhongzhi on 2017/8/18.
//  Copyright © 2017年 zhongzhi. All rights reserved.
//

#import "NSString+NCDate.h"

@implementation NSString (NCDate)
+(NSString *)timeIntervalFromTimeStr:(NSString *)timeStr{
    NSDateFormatter *fmt = [[NSDateFormatter alloc] init];
    // 设置日期格式(为了转换成功)
    fmt.dateFormat = @"yyyy-MM-dd HH:mm:ss";
    // NSString * -> NSDate *
    NSDate *date = [fmt dateFromString:timeStr];
    
    return [NSString stringWithFormat:@"%.f",date.timeIntervalSince1970 *1000];
}
+(NSString *)formateDate:(NSString *)string{
    NSTimeInterval second = string.longLongValue / 1000.0; //毫秒需要除
    
    // 时间戳 -> NSDate *
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:second];
    //    NSLog(@"%@", date);
    
    NSDateFormatter *fmt = [[NSDateFormatter alloc] init];
    fmt.dateFormat = @"yyyy-MM-dd HH:mm";
    
    NSString *stringNew = [fmt stringFromDate:date];
    return stringNew;
}
+(NSString *)formateDateToDay:(NSString *)string{
    NSTimeInterval second = string.longLongValue / 1000.0; //毫秒需要除
    
    // 时间戳 -> NSDate *
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:second];
    //    NSLog(@"%@", date);
    
    NSDateFormatter *fmt = [[NSDateFormatter alloc] init];
    fmt.dateFormat = @"yyyy-MM-dd";
    
    NSString *stringNew = [fmt stringFromDate:date];
    return stringNew;
}

+(NSString *)formateDateOnlyYueri:(NSString *)string{
    NSTimeInterval second = string.longLongValue / 1000.0; //毫秒需要除
    
    // 时间戳 -> NSDate *
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:second];
    //    NSLog(@"%@", date);
    
    NSDateFormatter *fmt = [[NSDateFormatter alloc] init];
    fmt.dateFormat = @"MM-dd";
    
    NSString *stringNew = [fmt stringFromDate:date];
    return stringNew;
}
+(NSString *)formateDateOnlyShifen:(NSString *)string{
    
    NSTimeInterval second = string.longLongValue / 1000.0; //毫秒需要除
    
    // 时间戳 -> NSDate *
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:second];
    //    NSLog(@"%@", date);
    
    NSDateFormatter *fmt = [[NSDateFormatter alloc] init];
    fmt.dateFormat = @"HH:mm";
    
    NSString *stringNew = [fmt stringFromDate:date];
    return stringNew;
}
+(NSInteger)getNowInterVal{
    NSDate  *date = [NSDate date];
    return date.timeIntervalSince1970 * 1000; //乘以1000为毫秒
}
+(NSString *)getNowTime{
    NSDate  *date = [NSDate date];
    
    NSDateFormatter *fmt = [[NSDateFormatter alloc] init];
    // 设置日期格式(为了转换成功)
    fmt.dateFormat = @"yyyy-MM-dd";
    NSString *dateStr =[fmt stringFromDate:date];
    return dateStr;
}
+(NSDate *)dateFromTimeStr:(NSString *)timeStr{
    NSDateFormatter *fmt = [[NSDateFormatter alloc] init];
    // 设置日期格式(为了转换成功)
    [fmt setTimeZone:[NSTimeZone timeZoneWithAbbreviation:@"UTC"]];
    fmt.dateFormat = @"yyyy-MM-dd";
    // NSString * -> NSDate *
    NSDate *date = [fmt dateFromString:timeStr];
    return date;
}

+(NSString *)ret32bitString

{
    
    char data[32];
    
    for (int x=0;x<32;data[x++] = (char)('A' + (arc4random_uniform(26))));
    
    return [[NSString alloc] initWithBytes:data length:32 encoding:NSUTF8StringEncoding];
    
}
@end
