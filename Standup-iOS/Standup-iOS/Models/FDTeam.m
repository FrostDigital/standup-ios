//
//  FDTeam.m
//  Standup-iOS
//
//  Created by Sergii Nezdolii on 2014-06-13.
//  Copyright (c) 2014 FrostDigital. All rights reserved.
//

#import "FDTeam.h"
#import "FDUser.h"

//KEYS
#define kTeamName   @"teamName"
#define kUsers      @"users"
#define kStandups   @"standups"

@implementation FDTeam

- (instancetype)initWithDictionary:(NSDictionary *)teamDictionary {
    if (self = [super init]) {
        NSArray *allKeys = [teamDictionary allKeys];
        if([allKeys containsObject:kTeamName]) {
            self.teamName = teamDictionary[kTeamName];
        }
        if ([allKeys containsObject:kUsers]) {
            self.users = [[NSMutableArray alloc] init];
            NSArray *usersDicts = teamDictionary[kUsers];
            for (NSDictionary *user in usersDicts) {
                [self.users addObject:[[FDUser alloc] initWithDictionary:user]];
            }
        }
    }
    return self;
}

@end
