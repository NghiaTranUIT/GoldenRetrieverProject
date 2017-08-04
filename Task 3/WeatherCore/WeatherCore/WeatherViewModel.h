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
#import "LocationService.h"

@class WeatherObj;

@interface WeatherViewModel : NSObject

-(void) requestCurrentLocation:(LocationBlock) locationBlock errorBlock:(ErrorBlock) errorBlock;

-(void) fetchWeatherAtLocation:(CLLocationCoordinate2D) location
                    completion:(WeatherCompletionBlock) success
                         error:(ErrorBlock) error;

@end
