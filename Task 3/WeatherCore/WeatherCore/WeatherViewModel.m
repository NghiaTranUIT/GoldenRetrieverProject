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

@property (strong, nonatomic) id<WeatherServiceProtocol> weatherService;
@property (strong, nonatomic) LocationService *locationService;

@end

@implementation WeatherViewModel

-(instancetype) initWithDefaultService {
    OpenWeatherService *service = [[OpenWeatherService alloc] init];
    return [self initWithService:service];
}

-(instancetype) initWithService:(id<WeatherServiceProtocol>) service {
    self = [super init];

    if (self) {

        // Weather service
        //
        // Currently, WeatherViewModel doesn't heavily depended on any certain OpenWeatherService
        // It's really flexible when we need different WeatherAPI from another source
        //
        // Only things we should to is create new Class which apdapt WeatherServiceProtocol
        // For example, YahooWeatherService, GoogleWeatherService
        //
        // It's following totally SOLID principle
        //
        self.weatherService = service;

        // Location service should be singleton for temporary
        // Personally I think we shouldn't do that in production
        //
        // Instead, we defind LocationService Protocol
        self.locationService = [LocationService shareInstance];
    }

    return self;
}

-(CLAuthorizationStatus) authorizationStatus {
    return [LocationService authorizationStatus];
}

-(void)requestCurrentLocation:(LocationBlock)locationBlock errorBlock:(ErrorBlock)errorBlock {

    // Get current Status
    CLAuthorizationStatus status = [self authorizationStatus];

    // Switch
    switch (status) {
        case kCLAuthorizationStatusNotDetermined: {
            __weak typeof(self) weakSelf = self;

            //
            // Request permission
            // then fetching current location
            [self.locationService requestWhenInUseAuthorization:^{
                typeof(self) strongSelf = weakSelf;
                [strongSelf.locationService fetchLocation:locationBlock errorBlock:errorBlock];
            }];
            break;
        }
        case kCLAuthorizationStatusDenied:
        case kCLAuthorizationStatusRestricted:

            // If status is Denied or Restricted
            // Notify Error block
            if (errorBlock) {
                errorBlock(nil);
            }
            break;

        case kCLAuthorizationStatusAuthorizedAlways:
        case kCLAuthorizationStatusAuthorizedWhenInUse:

            // If it's already
            // Fetch location
            [self.locationService fetchLocation:locationBlock errorBlock:errorBlock];

    }
}

-(void) fetchWeatherAtLocation:(CLLocationCoordinate2D) location
                    completion:(WeatherCompletionBlock) success
                         error:(ErrorBlock) error {
    [self.weatherService fetchWeatherAtLocation:location completion:success error:error];
}

@end
