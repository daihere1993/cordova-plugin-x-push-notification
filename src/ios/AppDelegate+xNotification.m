//
//  AppDelegate+notification.m
//
//  Created by daihere on 11/08/2017.
//
//

#import "AppDelegate+xNotification.h"
#import "CDVXNotification.h"

@implementation AppDelegate (xNotification)

- (id)getCommandInstance:(NSString *)className {
    return [self.viewController getCommandInstance:className];
}

- (void)application:(UIApplication *)application didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken {
    NSLog(@"didRegisterForRemoteNotificationsWithDeviceToken");
    NSString *token = [[[[deviceToken description] stringByReplacingOccurrencesOfString:@"<" withString:@""] stringByReplacingOccurrencesOfString:@">" withString:@""] stringByReplacingOccurrencesOfString:@" " withString:@""];
    NSLog(@"%@",token);
    CDVXNotification *messagerHandler = [self getCommandInstance:@"CDVXNotification"];
    [messagerHandler didRegisterForRemoteNotificationsWithDeviceToken:token];
}

- (void)application:(UIApplication *)application didFailToRegisterForRemoteNotificationsWithError:(NSError *)error {
    NSLog(@"Register fail %@", error);
    CDVXNotification *messagerHandler = [self getCommandInstance:@"CDVXNotification"];
    [messagerHandler didFailToRegisterForRemoteNotificationsWithError:error];
}

- (void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo {
    NSLog(@"clicked on the shade");
    CDVXNotification *messagerHandler = [self getCommandInstance:@"CDVXNotification"];
    [messagerHandler notificationReceived:userInfo isLaunch:NO];
}

- (void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo fetchCompletionHandler:(void (^)(UIBackgroundFetchResult))completionHandler {
    NSLog(@"didReceiveNotification with fetchCompletionHandler");
    
    if (application.applicationState == UIApplicationStateActive) {
        CDVXNotification *messagerHandler = [self getCommandInstance:@"CDVXNotification"];
        [messagerHandler notificationReceived:userInfo isLaunch:YES];
    } else {
        long silent = 0;
        id aps = [userInfo objectForKey:@"aps"];
        id contentAvailable = [aps objectForKey:@"content-available"];
        
        if ([contentAvailable isKindOfClass:[NSString class]] && [contentAvailable isEqualToString:@"1"]) {
            silent = 1;
        } else if ([contentAvailable isKindOfClass:[NSNumber class]]) {
            silent = [contentAvailable integerValue];
        }
        
        if (silent == 1) {
            NSLog(@"This should silent push");
            CDVXNotification *messagerHandler = [self getCommandInstance:@"CDVXNotification"];
            [messagerHandler notificationReceived:userInfo isLaunch:NO];
            
        } else {
            NSLog(@"just put it in the shade");
            
            completionHandler(UIBackgroundFetchResultNewData);
        }
    }
}

@end