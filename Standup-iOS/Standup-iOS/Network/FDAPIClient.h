//
//  FDAPIClient.h
//  Standup-iOS
//
//  Created by Sergii Nezdolii on 2014-06-13.
//  Copyright (c) 2014 FrostDigital. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFNetworking.h"

@interface FDAPIClient : NSObject

+ (instancetype) sharedInstance;

- (void)registerForPushNotificationsWithDeviceToken:(NSString *)deviceToken
                                             userId:(NSString *)userId;

- (void)getTeamWithId:(NSString *) teamId
              success:(void (^)(AFHTTPRequestOperation *operation, id responseObject)) success
              failure:(void (^)(AFHTTPRequestOperation *operation, NSError *error)) failure;

@end
