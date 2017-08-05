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

#pragma mark - Init

-(instancetype) init {
    return [self initWithNetworkService:[NetworkService new] configuration:[OpenWeatherConfiguration new]];
}

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

#pragma mark - Fetch Weather

// It's on my purpose
//
// We encapsulate all essential requests in OpenWeatherService
// We don't need to expose our internal resource to ourside
//
-(void) fetchWeatherAtLocation:(CLLocationCoordinate2D) location completion:(WeatherCompletionBlock) success error:(ErrorBlock) error {

    // Create param
    FetchWeatherRequestParam *param = [[FetchWeatherRequestParam alloc] initWithLocation:location appID:self.configuration.appID];

    // Create request
    FetchWeatherRequest *request = [[FetchWeatherRequest alloc] initWithParam:param];
    request.completionBlock = [success copy];
    request.errorBlock = [error copy];

    // Execute
    [self.networkService executeRequest:request];
}

@end
