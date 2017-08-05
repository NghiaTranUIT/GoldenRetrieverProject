//
//  FetchWeatherRequestParam.h
//  WeatherCore
//
//  Created by Nghia Tran on 8/4/17.
//  Copyright © 2017 Nghia Tran. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>
#import "Parammeter.h"


/**
 Parammeter for FetchWeatherAPI
 It encansulates all required parammeter
 */
@interface FetchWeatherRequestParam: NSObject <Parammeter>

// Data
@property (assign, nonatomic, readonly) CLLocationCoordinate2D location;
@property (copy, nonatomic, readonly) NSString *appID;

-(instancetype) initWithLocation:(CLLocationCoordinate2D) location appID:(NSString *) appID;

@end
