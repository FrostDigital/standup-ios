//
//  FDTeam.h
//  Standup-iOS
//
//  Created by Sergii Nezdolii on 2014-06-13.
//  Copyright (c) 2014 FrostDigital. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FDTeam : NSObject

@property (strong, nonatomic) NSString *teamName;
@property (strong, nonatomic) NSMutableArray *users;
@property (strong, nonatomic) NSMutableArray *standups;

- (instancetype) initWithDictionary:(NSDictionary *)teamDictionary;

@end
