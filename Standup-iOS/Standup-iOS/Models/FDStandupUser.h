//
//  FDStandupuser.h
//  Standup-iOS
//
//  Created by Sergii Nezdolii on 2014-06-13.
//  Copyright (c) 2014 FrostDigital. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FDStandupUser : NSObject

@property (nonatomic, copy) NSString *userId;
@property (nonatomic, copy) NSString *badge;
@property (nonatomic, copy) NSArray *today;
@property (nonatomic, copy) NSArray *yesterday;

- (instancetype) initWithDictionary:(NSDictionary *) dictionary;

@end
