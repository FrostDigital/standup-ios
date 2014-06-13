//
//  FDAPIClient.h
//  Standup-iOS
//
//  Created by Sergii Nezdolii on 2014-06-13.
//  Copyright (c) 2014 FrostDigital. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FDAPIClient : NSObject

+ (instancetype) sharedInstance;

- (void) registerForPushNotificationsWithDeviceToken:(NSString *)deviceToken userid:(NSString *)userId;

@end
