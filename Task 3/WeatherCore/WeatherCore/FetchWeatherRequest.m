//
//  FetchWeatherRequest.m
//  WeatherCore
//
//  Created by Nghia Tran on 8/4/17.
//  Copyright © 2017 Nghia Tran. All rights reserved.
//

#import "FetchWeatherRequest.h"
#import "Constants.h"
#import "WeatherObj.h"

@implementation FetchWeatherRequest

-(HTTPMethod) httpMethod {
    return HTTPMethodGET;
}

-(NSString *) path {
    return k_API_WEATHER;
}

-(id) decodeObject:(id)response {

    // Check nil
    if (response == nil) {
        return nil;
    }

    // Decode
    return [WeatherObj decode:response];
}

@end
