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
#import "WeatherServiceProtocol.h"

@class WeatherObj;
@class NetworkService;
@class OpenWeatherConfiguration;

/**
 Open Weather Service which correspond with OpenWeatherAPI
 */
@interface OpenWeatherService : NSObject <WeatherServiceProtocol>

// Init
-(instancetype) initWithNetworkService:(NetworkService *) service
                         configuration:(OpenWeatherConfiguration *) configuration;
-(instancetype) initWithNetworkService:(NetworkService *) service;

@end
