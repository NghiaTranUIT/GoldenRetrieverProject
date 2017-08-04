//
//  WeatherViewModel.m
//  WeatherCore
//
//  Created by Nghia Tran on 8/4/17.
//  Copyright © 2017 Nghia Tran. All rights reserved.
//

#import "WeatherViewModel.h"
#import "OpenWeatherService.h"

@interface WeatherViewModel ()

@property (strong, nonatomic) OpenWeatherService *weatherService;

@end

@implementation WeatherViewModel

-(instancetype) init {
    self = [super init];

    if (self) {

        // Default service
        self.weatherService = [[OpenWeatherService alloc] init];
    }

    return self;
}

-(void) fetchWeatherAtLocation:(CLLocationCoordinate2D) location
                    completion:(WeatherCompletionBlock) success
                         error:(ErrorBlock) error {

    [self.weatherService fetchWeatherAtLocation:location completion:success error:error];
}

@end
