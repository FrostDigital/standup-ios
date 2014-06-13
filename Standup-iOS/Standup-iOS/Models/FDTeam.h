//
//  FDTeam.h
//  Standup-iOS
//
//  Created by Sergii Nezdolii on 2014-06-13.
//  Copyright (c) 2014 FrostDigital. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FDTeam : NSObject

@property (copy, nonatomic) NSString *teamId;
@property (copy, nonatomic) NSString *teamName;
@property (copy, nonatomic) NSArray *users;
@property (copy, nonatomic) NSArray *standups;

- (instancetype) initWithDictionary:(NSDictionary *)teamDictionary;

@end
