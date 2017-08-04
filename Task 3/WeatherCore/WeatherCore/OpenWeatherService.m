//
//  OpenWeatherService.m
//  WeatherCore
//
//  Created by Nghia Tran on 8/4/17.
//  Copyright © 2017 Nghia Tran. All rights reserved.
//

#import "OpenWeatherService.h"
#import "NetworkService.h"
#import "FetchWeatherRequest.h"
#import "FetchWeatherRequestParam.h"
#import "OpenWeatherConfiguration.h"

@interface OpenWeatherService ()

@property (strong, nonatomic) NetworkService *networkService;
@property (strong, nonatomic) OpenWeatherConfiguration *configuration;
@end

@implementation OpenWeatherService

-(instancetype) initWithNetworkService:(NetworkService *) service {
    return [self initWithNetworkService:service configuration:[OpenWeatherConfiguration new]];
}

-(instancetype) initWithNetworkService:(NetworkService *) service
                         configuration:(OpenWeatherConfiguration *) configuration {
    self = [super init];

    if (self) {
        self.networkService = service;
        self.configuration = configuration;
    }

    return self;
}

-(void) fetchWeatherAtLocation:(CLLocationCoordinate2D) location completion:(WeatherCompletionBlock) block {
    FetchWeatherRequestParam *param = [[FetchWeatherRequestParam alloc] initWithLocation:location appID:self.configuration.appID];
    FetchWeatherRequest *request = [[FetchWeatherRequest alloc] initWithParam:param];
    [self.networkService executeRequest:request];
}

@end
