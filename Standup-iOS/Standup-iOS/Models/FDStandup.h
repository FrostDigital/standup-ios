//
//  FDStandup.h
//  Standup-iOS
//
//  Created by Sergii Nezdolii on 2014-06-13.
//  Copyright (c) 2014 FrostDigital. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FDStandup : NSObject

@property (strong, nonatomic) NSDate *date;
@property (nonatomic, copy) NSArray *users;

- (instancetype) initWithDictionary:(NSDictionary *) dictionary;

@end