//
//  FDUser.h
//  Standup-iOS
//
//  Created by Sergii Nezdolii on 2014-06-13.
//  Copyright (c) 2014 FrostDigital. All rights reserved.
//

#import <Foundation/Foundation.h>

#define STATE_ACTIVE   @"ACTIVE"
#define STATE_INACTIVE   @"INACTIVE"

@interface FDUser : NSObject

@property (strong, nonatomic) NSString *name;
@property (strong, nonatomic) NSString *userId;
@property (strong, nonatomic) NSString *avatar;
@property (nonatomic, getter=isActive) BOOL active;


- (instancetype) initWithDictionary:(NSDictionary *)userDictionary;

@end
