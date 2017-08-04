//
//  AppDelegate.m
//  Weather
//
//  Created by Nghia Tran on 8/4/17.
//  Copyright © 2017 Nghia Tran. All rights reserved.
//

#import "AppDelegate.h"
#import "Router.h"

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

@end
