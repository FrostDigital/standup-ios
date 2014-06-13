//
//  FDStandupuser.m
//  Standup-iOS
//
//  Created by Sergii Nezdolii on 2014-06-13.
//  Copyright (c) 2014 FrostDigital. All rights reserved.
//

#import "FDStandupUser.h"
#import "FDTodoItem.h"

#define kUserIdKey @"userId"
#define kBadgeKey @"badge"
#define kYesterdayKey @"yesterday"
#define kTodayKey @"today"

@implementation FDStandupUser

- (instancetype)initWithDictionary:(NSDictionary *)dictionary
{
    if (self = [super init])
    {
        _userId = [dictionary objectForKey:kUserIdKey];
        _badge = [dictionary objectForKey:kBadgeKey];
        
        NSMutableArray *todayItems = [NSMutableArray array];
        
        for (NSDictionary *dict in [dictionary objectForKey:kTodayKey])
        {
            FDTodoItem *todoItem = [[FDTodoItem alloc] initWithDictionary:dict];
            [todayItems addObject:todoItem];
        }
        
        _today = [NSArray arrayWithArray:todayItems];
        
        NSMutableArray *yesterdayItems = [NSMutableArray array];
        
        for (NSDictionary *dict in [dictionary objectForKey:kYesterdayKey])
        {
            FDTodoItem *todoItem = [[FDTodoItem alloc] initWithDictionary:dict];
            [todayItems addObject:todoItem];
        }
        
        _yesterday = [NSArray arrayWithArray:yesterdayItems];
    }
    
    return self;
}

//{
//                  "userId": "45cd0a3e-214a-43d8-9d84-eaacf78e9bcd",
//                  "badge": "",
//                  "today": [
//                            {
//                                "text": "Hackathon!",
//                                "completed": false
//                            }
//                            ],
//                  "yesterday": [
//                                {
//                                    "text": "Sanoma utbildning Angular",
//                                    "completed": true
//                                }
//                                ]
//              },
@end
