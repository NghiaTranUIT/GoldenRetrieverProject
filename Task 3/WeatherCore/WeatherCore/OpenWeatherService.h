//
//  OpenWeatherService.h
//  WeatherCore
//
//  Created by Nghia Tran on 8/4/17.
//  Copyright © 2017 Nghia Tran. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>
#import "Constants.h"

@class WeatherObj;
@class NetworkService;
@class OpenWeatherConfiguration;

@interface OpenWeatherService : NSObject

// Init
-(instancetype) initWithNetworkService:(NetworkService *) service
                         configuration:(OpenWeatherConfiguration *) configuration;
-(instancetype) initWithNetworkService:(NetworkService *) service;

// Fetch
-(void) fetchWeatherAtLocation:(CLLocationCoordinate2D) location completion:(WeatherCompletionBlock) success error:(ErrorBlock) error;

@end
