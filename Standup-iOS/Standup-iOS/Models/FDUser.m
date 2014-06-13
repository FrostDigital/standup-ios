//
//  FDUser.m
//  Standup-iOS
//
//  Created by Sergii Nezdolii on 2014-06-13.
//  Copyright (c) 2014 FrostDigital. All rights reserved.
//

#import "FDUser.h"

#define kName   @"name"
#define kUserId @"userId"
#define kAvatar @"avatar"
#define kState  @"state"

@implementation FDUser

- (instancetype)initWithDictionary:(NSDictionary *)userDictionary {
    if (self = [super init]) {
        NSArray *allKeys = [userDictionary allKeys];
        if ([allKeys containsObject:kName]) {
            self.name = userDictionary[kName];
        }
        if ([allKeys containsObject:kUserId]) {
            self.userId = userDictionary[kUserId];
        }
        if ([allKeys containsObject:kAvatar]) {
            self.avatar = userDictionary[kAvatar];
        }
        if ([allKeys containsObject:kState]) {
            self.active = [userDictionary[kState] isEqualToString:STATE_ACTIVE];
        }
    }
    return self;
}

@end
