//
//  AppDelegate.m
//  Weather
//
//  Created by Nghia Tran on 8/4/17.
//  Copyright © 2017 Nghia Tran. All rights reserved.
//

#import <WeatherCore/WeatherCore.h>
#import "AppDelegate.h"
#import "Router.h"
#import "UIAlertController+Helper.h"

@interface AppDelegate ()

@property (strong, nonatomic) Router *router;

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {

    // Use router class to coordinate controllers or scenses
    // It's elegant approach when we have over 5+ screen
    // Testable
    self.router = [[Router alloc] init];
    self.window = [self.router prepareRootViewController];

    return YES;
}

// Start monitor as long as app becomes active.
-(void)applicationDidBecomeActive:(UIApplication *)application {

    // Observer status of internet
    //
    // It's really important to notify user when the Internet went down.
    // It's production app, we should use StatusBar Alert
    // Instead of poping up the ugly UIAlertController
    //
    // Furthermore, we might get what kind of source Internet (Wifi, 3G, 4G)
    // Then reducing resource as possible.
    //
    // But in this demonstration. I will use Pop-up
    //
    // Reach
    __weak typeof(self) weakSelf = self;
    [Reachability startMonitoringWithBlock:^(AFNetworkReachabilityStatus status) {

        // Guard
        if (weakSelf == nil) {
            return ;
        }
        if (weakSelf.window.rootViewController == nil) {
            return;
        }
        [UIAlertController presentAlertControllerWithMessage:@"Internet was dropped. Please try again!" rootController:weakSelf.window.rootViewController];
    }];
}

// Stopping monitoring the internet to avoid waste valuable resource
-(void)applicationDidEnterBackground:(UIApplication *)application {
    [Reachability stopMonitoring];
}

@end
