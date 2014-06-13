//
//  FDTeam.m
//  Standup-iOS
//
//  Created by Sergii Nezdolii on 2014-06-13.
//  Copyright (c) 2014 FrostDigital. All rights reserved.
//

#import "FDTeam.h"
#import "FDUser.h"
#import "FDStandup.h"

//KEYS
#define kTeamId     @"teamId"
#define kTeamName   @"teamName"
#define kUsers      @"users"
#define kStandups   @"standups"

@implementation FDTeam

- (instancetype)initWithDictionary:(NSDictionary *)teamDictionary
{
    if (self = [super init])
    {
        NSArray *allKeys = [teamDictionary allKeys];
        
        if ([allKeys containsObject:kTeamId])
        {
            self.teamId = teamDictionary[kTeamId];
        }
        
        if ([allKeys containsObject:kTeamName])
        {
            self.teamName = teamDictionary[kTeamName];
        }
        
        if ([allKeys containsObject:kUsers])
        {
            NSMutableArray *usersArray = [NSMutableArray array];
            
            for (NSDictionary *userDict in teamDictionary[kUsers])
            {
                FDUser *user = [[FDUser alloc] initWithDictionary:userDict];
                [usersArray addObject:user];
            }
            
            _users = [NSArray arrayWithArray:usersArray];
        }
        
        if ([allKeys containsObject:kStandups])
        {
            NSDictionary *dict = teamDictionary[kStandups];
            
            NSMutableArray *standupsArray = [NSMutableArray array];
            
            for (NSDictionary *standupDict in [dict allValues])
            {
                FDStandup *standup = [[FDStandup alloc] initWithDictionary:standupDict];
                [standupsArray addObject:standup];
            }
            
            _standups = [NSArray arrayWithArray:standupsArray];
        }
    }
    
    return self;
}

@end
