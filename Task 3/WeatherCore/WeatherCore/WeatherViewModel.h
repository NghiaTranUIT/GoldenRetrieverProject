//
//  WeatherViewModel.h
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


/**
 Weather View Model will encapsulate all logic in Weather Controller
 */
@interface WeatherViewModel : NSObject

/**
 Initilizer with weather service protocol

 @param service Weather service
 */
-(instancetype) initWithService:(id<WeatherServiceProtocol>) service;


/**
 Default serice with OpenWeatherService

 @return Instance
 */
-(instancetype) initWithDefaultService;

/**
 Check Location Permission
 and request current coordinate

 @param locationBlock SuccessBlock
 @param errorBlock ErrorBlock
 */
-(void) requestCurrentLocation:(LocationBlock) locationBlock errorBlock:(ErrorBlock) errorBlock;


/**
 Recieving 2DCoordinate and fetch weather status from OpenWeatherAPI

 @param location Lat/lng coordinate
 @param success Success Block
 @param error Error Block
 */
-(void) fetchWeatherAtLocation:(CLLocationCoordinate2D) location
                    completion:(WeatherCompletionBlock) success
                         error:(ErrorBlock) error;

@end
