//
//  FDAPIClient.m
//  Standup-iOS
//
//  Created by Sergii Nezdolii on 2014-06-13.
//  Copyright (c) 2014 FrostDigital. All rights reserved.
//

#import "FDAPIClient.h"
#import "FDTeamStorage.h"

#define PUSH_REGISTRATION_URL @"http://frost-standup-push.herokuapp.com/register"
#define kDeviceId @"deviceId"
#define kUserId @"userId"
#define kDeviceType @"deviceType"
#define kDeviceTypeiOS @"ios"

#define GET_TEAM_URL @"http://frost-standup.herokuapp.com/team/"

@interface FDAPIClient()

@property (strong, readonly) AFHTTPRequestOperationManager *manager;

@end

@implementation FDAPIClient

static FDAPIClient *instance = nil;

+ (instancetype) sharedInstance {
    static dispatch_once_t _singletonPredicate;

    dispatch_once(&_singletonPredicate, ^{
        instance = [[self alloc] init];
    });
    return instance;
}

- (id) init {

    if (self = [super init]) {
        _manager = [[AFHTTPRequestOperationManager manager] init];
        _manager.responseSerializer = [AFJSONResponseSerializer serializer];
        _manager.requestSerializer = [AFJSONRequestSerializer serializer];
    }

    return self;
}

- (void)registerForPushNotificationsWithDeviceToken:(NSString *)deviceToken userId:(NSString *)userId {

    [_manager POST:PUSH_REGISTRATION_URL
        parameters:@{kDeviceId: deviceToken, kUserId: userId, kDeviceType: kDeviceTypeiOS}
           success:^(AFHTTPRequestOperation *operation, id responseObject) {
               DDLogDebug(@"Push Registration SUCCESS");
           }
           failure:^(AFHTTPRequestOperation *operation, NSError *error) {
               DDLogError(@"Push Registration FAILED: %@", error.debugDescription);
           }
    ];
}

- (void)getTeamWithId:(NSString *)teamId success:(void (^)(AFHTTPRequestOperation *, id))success failure:(void (^)(AFHTTPRequestOperation *, NSError *))failure
{
    [_manager GET:[GET_TEAM_URL stringByAppendingString:teamId]
       parameters:nil
          success:^(AFHTTPRequestOperation *operation, id responseObject) {
              DDLogDebug(@"GET Team SUCCESS response: %@", responseObject);
              //Parse and save
              
              [[FDTeamStorage sharedStorage] createTeamFromDictionary:responseObject];
              
              if (success) {
                  success(operation, responseObject);
              }
          } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
              DDLogDebug(@"GET team FAIL error: %@", error.description);
              if (failure) {
                  failure(operation, error);
              }
          }];
}

@end
