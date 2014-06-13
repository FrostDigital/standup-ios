//
//  FDDateUtils.m
//  Standup-iOS
//
//  Created by Josefin Andersson on 2014-06-13.
//  Copyright (c) 2014 FrostDigital. All rights reserved.
//

#import "FDDateUtils.h"

@implementation FDDateUtils

static NSDateFormatter* dateFormatter;

+ (void) initialize
{
    dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd"];
}

+ (NSDate *)dateFromYyyyMmDdString:(NSString *)dateString
{
    return [dateFormatter dateFromString:dateString];
}

+ (BOOL)isTodaysDate:(NSDate *)date
{
    NSDateComponents *otherDay = [[NSCalendar currentCalendar] components:NSEraCalendarUnit|NSYearCalendarUnit|NSMonthCalendarUnit|NSDayCalendarUnit fromDate:date];
    NSDateComponents *today = [[NSCalendar currentCalendar] components:NSEraCalendarUnit|NSYearCalendarUnit|NSMonthCalendarUnit|NSDayCalendarUnit fromDate:[NSDate date]];
    
    return [today day] == [otherDay day] &&
    [today month] == [otherDay month] &&
    [today year] == [otherDay year] &&
    [today era] == [otherDay era];
}

@end
