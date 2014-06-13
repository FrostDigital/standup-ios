//
//  FDDateUtils.h
//  Standup-iOS
//
//  Created by Josefin Andersson on 2014-06-13.
//  Copyright (c) 2014 FrostDigital. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FDDateUtils : NSObject

+ (NSDate *) dateFromYyyyMmDdString:(NSString *)dateString;

+ (BOOL) isTodaysDate:(NSDate *) date;

@end
