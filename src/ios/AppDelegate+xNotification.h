//
//  AppDelegate+notification.h
//
//  Created by daihere on 11/08/2017.
//
//

#import "AppDelegate.h"

@interface AppDelegate (xNotification)

- (void)application:(UIApplication *)application didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken;
- (void)application:(UIApplication *)application didFailToRegisterForRemoteNotificationsWithError:(NSError *)error;
- (void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo;
- (id)getCommandInstance:(NSString *)className;

@end
