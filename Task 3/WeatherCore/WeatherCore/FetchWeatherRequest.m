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

    // We deocode object here
    //
    // In my intention
    // It's the best place to describle how to decode object
    //
    // Because in future, we probably have 100+ API
    // It's messy if we have some concrete class to handle JSONDecode
    //
    // We should seperate here for easily tracking
    return [WeatherObj decode:response];
}

@end
