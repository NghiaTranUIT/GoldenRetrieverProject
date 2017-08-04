//
//  FetchWeatherRequestParam.m
//  WeatherCore
//
//  Created by Nghia Tran on 8/4/17.
//  Copyright © 2017 Nghia Tran. All rights reserved.
//

#import "FetchWeatherRequestParam.h"

@interface FetchWeatherRequestParam ()

@property (assign, nonatomic) CLLocationCoordinate2D location;
@property (copy, nonatomic) NSString *appID;

@end

@implementation FetchWeatherRequestParam

-(instancetype) initWithLocation:(CLLocationCoordinate2D) location appID:(NSString *) appID {
    self = [super init];

    if (self) {
        self.location = location;
        self.appID = appID;
    }

    return self;
}

-(NSDictionary<NSString *,id> *)buildParam {
    return @{@"lat": @(self.location.latitude),
             @"lon": @(self.location.longitude),
             @"appid": self.appID};
}

@end
