//
//  FetchWeatherRequest.m
//  WeatherCore
//
//  Created by Nghia Tran on 8/4/17.
//  Copyright © 2017 Nghia Tran. All rights reserved.
//

#import "FetchWeatherRequest.h"


@interface FetchWeatherRequest ()

@property (strong, nonatomic) id<Parammeter> param;

@end

@implementation FetchWeatherRequest

-(instancetype) initWithParam:(id<Parammeter>)param {
    self = [super init];

    if (self) {
        self.param = param;
    }

    return self;
}

-(NSString *)path {
    return @"/data/2.5/weather";
}

-(NSURLRequest *)buildRequest {
    NSURL *url = [NSURL URLWithString:[self path]];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    return request;
}

@end
