//
//  FDAppDelegate.m
//  Standup-iOS
//
//  Created by Sergii Nezdolii on 2014-06-13.
//  Copyright (c) 2014 FrostDigital. All rights reserved.
//

#import "FDAppDelegate.h"
#import "FDAPIClient.h"
#import "AHAlertView.h"
#import "DDASLLogger.h"
#import "DDTTYLogger.h"

static const int ddLogLevel = LOG_LEVEL_VERBOSE;

@implementation FDAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    [self initLogger];
    [self askForPush];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}



#pragma mark - PUSH stuff

- (void) askForPush {
    [[UIApplication sharedApplication] registerForRemoteNotificationTypes:(UIRemoteNotificationTypeBadge |
        UIRemoteNotificationTypeSound |
        UIRemoteNotificationTypeAlert)];
}

- (void)application:(UIApplication *)application didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)_deviceToken {
    //Currently hardcoded with Joels userId
    NSString* deviceToken = [FDAppDelegate extractDeviceTokenFrom:_deviceToken];
    DDLogDebug(@"%s: APN device token: %@", __FUNCTION__, deviceToken);
    [[FDAPIClient sharedInstance] registerForPushNotificationsWithDeviceToken:deviceToken userid:@"45cd0a3e-214a-43d8-9d84-eaacf78e9bcd"];
}

- (void)application:(UIApplication *)application didFailToRegisterForRemoteNotificationsWithError:(NSError *)error {
    DDLogError(@"%s: %@",__PRETTY_FUNCTION__, error.debugDescription);
}

- (void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo {
    DDLogDebug(@"%s: userInfo: %@",__PRETTY_FUNCTION__, userInfo.description);
    AHAlertView *alert = [[AHAlertView alloc] initWithTitle:@"Push Message"
                                                    message:[[userInfo valueForKey:@"aps"] valueForKey:@"alert"]];
    [alert setCancelButtonTitle:@"OK" block:nil];
    [alert show];
}

- (void)application:(UIApplication *)application didReceiveLocalNotification:(UILocalNotification *)notification {

}


#pragma mark - UTILS

+(NSString*) extractDeviceTokenFrom:(NSData*)data {

    if(data != nil) {
        return [[[[data description]
            stringByReplacingOccurrencesOfString: @"<" withString: @""]
            stringByReplacingOccurrencesOfString: @">" withString: @""]
            stringByReplacingOccurrencesOfString: @" " withString: @""];
    }

    return nil;
}

- (void) initLogger {
    [DDLog addLogger:[DDASLLogger sharedInstance]];
    [DDLog addLogger:[DDTTYLogger sharedInstance]];
}

@end
