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

+ (NSString *)stringFromDate:(NSDate *)date
{   
    return [dateFormatter stringFromDate:date];
}

+ (BOOL)isSameDate:(NSDate *)date asCompareDate:(NSDate *)compareDate
{
    NSDateComponents *someDate = [[NSCalendar currentCalendar] components:NSEraCalendarUnit|NSYearCalendarUnit|NSMonthCalendarUnit|NSDayCalendarUnit fromDate:date];
    NSDateComponents *otherDate = [[NSCalendar currentCalendar] components:NSEraCalendarUnit|NSYearCalendarUnit|NSMonthCalendarUnit|NSDayCalendarUnit fromDate:compareDate];
    
    return [someDate day] == [otherDate day] &&
    [someDate month] == [otherDate month] &&
    [someDate year] == [otherDate year] &&
    [someDate era] == [otherDate era];
}

@end
