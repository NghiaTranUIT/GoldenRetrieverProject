//
//  OpenWeatherService.m
//  WeatherCore
//
//  Created by Nghia Tran on 8/4/17.
//  Copyright © 2017 Nghia Tran. All rights reserved.
//

#import "OpenWeatherService.h"
#import "NetworkService.h"

@interface OpenWeatherService ()

@property (strong, nonatomic) NetworkService *networkService;

@end

@implementation OpenWeatherService

-(instancetype) initWithNetworkService:(NetworkService *) service {
    self = [super init];

    if (self) {
        self.networkService = service;
    }

    return self;
}

-(void) fetchWeatherAtLocation:(CLLocationCoordinate2D *) location completion:(WeatherCompletionBlock) block {

}

@end
