//
//  DateGlobal.m
//  Weather
//
//  Created by Nghia Tran on 8/5/17.
//  Copyright © 2017 Nghia Tran. All rights reserved.
//

#import "DateGlobal.h"

@interface DateGlobal()

@end

@implementation DateGlobal

+(NSString *) humanHourFromUNIX:(CGFloat) unix {
    NSTimeInterval timestamp = (NSTimeInterval) unix;
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:timestamp];

    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *components = [calendar components:(NSCalendarUnitHour | NSCalendarUnitMinute) fromDate:date];
    NSInteger hour = [components hour];
    NSInteger minute = [components minute];
    return [NSString stringWithFormat:@"%ld:%ld", (long)hour, (long)minute];
}

@end
