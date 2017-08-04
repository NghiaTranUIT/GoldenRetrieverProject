//
//  OpenWeatherService.h
//  WeatherCore
//
//  Created by Nghia Tran on 8/4/17.
//  Copyright © 2017 Nghia Tran. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>

@class WeatherObj;
@class NetworkService;

typedef id (^WeatherCompletionBlock)(WeatherObj *weather);

@interface OpenWeatherService : NSObject

-(instancetype) initWithNetworkService:(NetworkService *) service;

-(void) fetchWeatherAtLocation:(CLLocationCoordinate2D *) location completion:(WeatherCompletionBlock) block;

@end
