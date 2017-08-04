//
//  Reachability.h
//  WeatherCore
//
//  Created by Nghia Tran on 8/5/17.
//  Copyright © 2017 Nghia Tran. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AFNetworking/AFNetworking.h>

@interface Reachability : NSObject

+(void) startMonitoringWithBlock:(void (^)(AFNetworkReachabilityStatus status)) statusBlock;

+(void) stopMonitoring;

@end
