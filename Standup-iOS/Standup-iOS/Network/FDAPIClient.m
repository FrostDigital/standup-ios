//
//  FDAPIClient.m
//  Standup-iOS
//
//  Created by Sergii Nezdolii on 2014-06-13.
//  Copyright (c) 2014 FrostDigital. All rights reserved.
//

#import "FDAPIClient.h"
#import "AFNetworking.h"
#import "UIImageView+AFNetworking.h"

#define BASE_URL @"http://frost-standup-push.herokuapp.com"

#define PUSH_REGISTRATION_URL @"/register"
#define kDeviceId @"deviceId"
#define kUserId @"userId"
#define kDeviceType @"deviceType"
#define kDeviceTypeiOS @"ios"

static const int ddLogLevel = LOG_LEVEL_VERBOSE;

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
        _manager = [[AFHTTPRequestOperationManager manager] initWithBaseURL:[NSURL URLWithString:BASE_URL]];
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
@end
