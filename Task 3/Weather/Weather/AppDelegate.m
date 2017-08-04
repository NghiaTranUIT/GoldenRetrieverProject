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

    // Init Router
    self.router = [[Router alloc] init];
    self.window = [self.router prepareRootViewController];

    return YES;
}
-(void)applicationDidBecomeActive:(UIApplication *)application {

    // Reach
    __weak typeof(self) weakSelf = self;
    [Reachability startMonitoringWithBlock:^(AFNetworkReachabilityStatus status) {
        if (weakSelf == nil) {
            return ;
        }
        if (weakSelf.window.rootViewController == nil) {
            return;
        }
        [UIAlertController presentAlertControllerWithMessage:@"Internet was dropped. Please try again!" rootController:weakSelf.window.rootViewController];
    }];
}

-(void)applicationDidEnterBackground:(UIApplication *)application {
    [Reachability stopMonitoring];
}

@end
