//
//  FDStandup.m
//  Standup-iOS
//
//  Created by Sergii Nezdolii on 2014-06-13.
//  Copyright (c) 2014 FrostDigital. All rights reserved.
//

#import "FDStandup.h"
#import "FDStandupUser.h"
#import "FDDateUtils.h"

#define kDateKey @"date"
#define kUsersKey @"users"

@implementation FDStandup

//{
//    "date": "2014-06-13",
//    "users": [
//              //              ]
//}

- (instancetype)initWithDictionary:(NSDictionary *)dictionary
{
    if (self = [super init])
    {
        NSMutableArray *users = [NSMutableArray array];
        
        for (NSDictionary *dict in [dictionary objectForKey:kUsersKey])
        {
            FDStandupUser *standupUser = [[FDStandupUser alloc] initWithDictionary:dict];
            [users addObject:standupUser];
        }
        
        _users = [NSArray arrayWithArray:users];
        _date = [FDDateUtils dateFromYyyyMmDdString:[dictionary objectForKey:kDateKey]];
    }
    
    return self;
}

@end