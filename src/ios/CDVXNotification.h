//
//  MQTTMessager.h
//  MQTTExample
//
//  Created by daihere on 07/07/2017.
//  Copyright © 2017 jmesnil.net. All rights reserved.
//
#import <Cordova/CDV.h>

@interface CDVXNotification : CDVPlugin

@property (nonatomic, strong) NSString *callbackId;
@property (nonatomic) BOOL isLaunch;
@property (nonatomic, strong) NSDictionary *notificationMessage;

- (void)start:(CDVInvokedUrlCommand *)command;
- (void)didRegisterForRemoteNotificationsWithDeviceToken:(NSString *)deviceToken;
- (void)didFailToRegisterForRemoteNotificationsWithError:(NSError *)error;
- (void)notificationReceived:(NSDictionary *)info isLaunch:(BOOL)isLaunch;

@end
