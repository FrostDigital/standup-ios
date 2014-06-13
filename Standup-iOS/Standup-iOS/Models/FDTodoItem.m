//
//  FDTodoItem.m
//  Standup-iOS
//
//  Created by Sergii Nezdolii on 2014-06-13.
//  Copyright (c) 2014 FrostDigital. All rights reserved.
//

#import "FDTodoItem.h"

#define kTextKey @"text"
#define kCompletedKey @"completed"

@implementation FDTodoItem
//                                {
//                                    "text": "Hackathon!",
//                                    "completed": false
//                                }

- (instancetype)initWithDictionary:(NSDictionary *)dictionary
{
    if (self = [super init])
    {
        _text = [dictionary objectForKey:kTextKey];
        _completed = [[dictionary objectForKey:kCompletedKey] boolValue];
    }
    
    return self;
}

@end
