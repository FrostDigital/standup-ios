//
//  FDTodoItem.h
//  Standup-iOS
//
//  Created by Sergii Nezdolii on 2014-06-13.
//  Copyright (c) 2014 FrostDigital. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FDTodoItem : NSObject

@property (nonatomic, copy) NSString *text;
@property (nonatomic) BOOL completed;

- (instancetype) initWithDictionary:(NSDictionary *) dictionary;

@end
