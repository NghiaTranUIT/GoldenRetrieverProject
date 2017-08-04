//
//  Router.m
//  Weather
//
//  Created by Nghia Tran on 8/4/17.
//  Copyright © 2017 Nghia Tran. All rights reserved.
//

#import "Router.h"
#import "WeatherViewController.h"

@implementation Router

-(UIWindow *) prepareRootViewController {

    CGRect frame = [UIScreen mainScreen].bounds;
    UIWindow *window = [[UIWindow alloc] initWithFrame:frame];

    window.rootViewController = [self weatherController];
    [window makeKeyAndVisible];
    return window;
}

-(WeatherViewController *) weatherController {
    WeatherViewController *controller = [[WeatherViewController alloc] initWithNibName:@"WeatherViewController" bundle:nil];
    return controller;
}

@end
