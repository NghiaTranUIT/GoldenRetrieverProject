//
//  Reachability.m
//  WeatherCore
//
//  Created by Nghia Tran on 8/5/17.
//  Copyright © 2017 Nghia Tran. All rights reserved.
//

#import "Reachability.h"

@implementation Reachability

+(void) startMonitoringWithBlock:(void (^)(AFNetworkReachabilityStatus status)) statusBlock {
    [[AFNetworkReachabilityManager sharedManager] setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
        NSLog(@"Reachability: %@", AFStringFromNetworkReachabilityStatus(status));
    }];

    [[AFNetworkReachabilityManager sharedManager] startMonitoring];
}

+(void) stopMonitoring {
    [[AFNetworkReachabilityManager sharedManager] stopMonitoring];
}

@end
