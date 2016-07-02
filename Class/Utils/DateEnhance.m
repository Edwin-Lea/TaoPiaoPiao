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

@end
