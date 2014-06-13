//
//  FDTeamStorage.m
//  Standup-iOS
//
//  Created by Sergii Nezdolii on 2014-06-13.
//  Copyright (c) 2014 FrostDigital. All rights reserved.
//

#import "FDTeamStorage.h"

@implementation FDTeamStorage {
    NSMutableDictionary *teamsDictionary;
}

+(instancetype) sharedStorage {
    static FDTeamStorage *sharedStorage;
    static dispatch_once_t once;
    
    dispatch_once(&once, ^{
        sharedStorage = [[self alloc]init];
        sharedStorage->teamsDictionary = [NSMutableDictionary dictionary];
    });
    
    return sharedStorage;
}

@end
