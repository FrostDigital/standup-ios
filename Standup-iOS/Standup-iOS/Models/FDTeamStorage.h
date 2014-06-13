//
//  FDTeamStorage.h
//  Standup-iOS
//
//  Created by Sergii Nezdolii on 2014-06-13.
//  Copyright (c) 2014 FrostDigital. All rights reserved.
//

#import <Foundation/Foundation.h>

@class FDTeam;

@interface FDTeamStorage : NSObject

+ (instancetype) sharedStorage;

- (void)createTeamFromDictionary:(NSDictionary *) dictionary;

- (FDTeam *) activeTeam;

@end
