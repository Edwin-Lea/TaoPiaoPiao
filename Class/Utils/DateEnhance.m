//
//  DateEnhance.m
//  TaoPiaoPiao
//
//  Created by blackcater on 16/7/2.
//  Copyright (c) 2016 blackcater. All rights reserved.
//

#import "DateEnhance.h"

@implementation DateEnhance

/**
 * 通过时间片得到事件对象
 */
+ (NSDate *)getDate:(double)time {
    return [[NSDate alloc] initWithTimeIntervalSince1970:time];
}

/**
 * 通过时间片得到字符串事件格式
 */
+ (NSString *)printDate:(double)time {
    NSDate *date = [self getDate:time];
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    formatter.dateFormat = @"yyyy-MM-dd";
    return [formatter stringFromDate:date];
}

+ (NSString *)getWeakDay:(double)time {
    NSArray * arr =@[@"周日",@"周一",@"周二",@"周三",@"周四",@"周五",@"周六"];

    NSDate *date = [self getDate:time];

    NSDate *now = [NSDate date];
    NSDate *nextDay = [NSDate dateWithTimeIntervalSinceNow:+(24*60*60)];

    if (date < nextDay && now < date) {
        return [NSString stringWithFormat:@"%@ 明天", [self printDate:time]];
    } else {
        NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierChinese];
        NSDateComponents *components = [calendar components:NSCalendarUnitWeekday fromDate:date];
        return [NSString stringWithFormat:@"%@ %@", [self printDate:time], arr[(NSUInteger)[components weekday]]];
    }
}

@end
