//
//  WeatherViewModel.m
//  WeatherCore
//
//  Created by Nghia Tran on 8/4/17.
//  Copyright © 2017 Nghia Tran. All rights reserved.
//

#import "WeatherViewModel.h"
#import "OpenWeatherService.h"
#import "LocationService.h"

@interface WeatherViewModel ()

@property (strong, nonatomic) OpenWeatherService *weatherService;
@property (strong, nonatomic) LocationService *locationService;

@end

@implementation WeatherViewModel

-(instancetype) init {
    self = [super init];

    if (self) {

        // Default service
        self.weatherService = [[OpenWeatherService alloc] init];
        self.locationService = [LocationService shareInstance];
    }

    return self;
}

-(CLAuthorizationStatus) authorizationStatus {
    return [LocationService authorizationStatus];
}

-(BOOL) locationServicesEnabled {
    return [LocationService locationServicesEnabled];
}

-(void)requestCurrentLocation:(LocationBlock)locationBlock errorBlock:(ErrorBlock)errorBlock {

    CLAuthorizationStatus state = [self authorizationStatus];

    switch (state) {
        case kCLAuthorizationStatusNotDetermined: {
            [self.locationService requestWhenInUseAuthorization:^{
                [self.locationService fetchLocation:locationBlock errorBlock:errorBlock];
            }];
            break;
        }
        case kCLAuthorizationStatusDenied:
        case kCLAuthorizationStatusRestricted:
            if (errorBlock) {
                errorBlock(nil);
            }
            break;

        case kCLAuthorizationStatusAuthorizedAlways:
        case kCLAuthorizationStatusAuthorizedWhenInUse:
            [self.locationService fetchLocation:locationBlock errorBlock:errorBlock];

    }
}

-(void) fetchWeatherAtLocation:(CLLocationCoordinate2D) location
                    completion:(WeatherCompletionBlock) success
                         error:(ErrorBlock) error {
    [self.weatherService fetchWeatherAtLocation:location completion:success error:error];
}

@end
