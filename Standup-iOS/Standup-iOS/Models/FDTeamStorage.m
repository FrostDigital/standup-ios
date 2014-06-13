//
//  FDTeamStorage.m
//  Standup-iOS
//
//  Created by Sergii Nezdolii on 2014-06-13.
//  Copyright (c) 2014 FrostDigital. All rights reserved.
//

#import "FDTeamStorage.h"
#import "FDTeam.h"
#import "FDStandup.h"
#import "FDDateUtils.h"
#import "FDStandupUser.h"
#import "FDUser.h"

@implementation FDTeamStorage
{
    FDTeam *activeTeam;
}

+(instancetype) sharedStorage {
    static FDTeamStorage *sharedStorage;
    static dispatch_once_t once;
    
    dispatch_once(&once, ^{
        sharedStorage = [[self alloc]init];
    });
    
    return sharedStorage;
}

- (void)createTeamFromDictionary:(NSDictionary *)dictionary
{
    FDTeam *team = [[FDTeam alloc] initWithDictionary:dictionary];
    activeTeam = team;
}

- (FDTeam *)activeTeam
{
    return activeTeam;
}

- (FDStandupUser *)standupUserForUser:(FDUser *)user date:(NSDate *)date
{    
    for (FDStandup *standup in activeTeam.standups)
    {
        if ([FDDateUtils isSameDate:standup.date asCompareDate:date])
        {
            for (FDStandupUser *standupUser in standup.users)
            {
                if ([user.userId isEqualToString:standupUser.userId])
                {
                    return standupUser;
                }
            }
        }
    }
    
    return nil;
}

@end
