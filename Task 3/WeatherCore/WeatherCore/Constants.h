//
//  Constants.h
//  WeatherCore
//
//  Created by Nghia Tran on 8/4/17.
//  Copyright © 2017 Nghia Tran. All rights reserved.
//

static NSString *const __nonnull k_API_ROOT = @"http://";
static NSString *const __nonnull k_API_BASE = @"api.openweathermap.org";
static NSString *const __nonnull k_API_WEATHER = @"/data/2.5/weather";

@class WeatherObj;

typedef void (^CompletionBlock)(__nullable id obj);
typedef void (^ErrorBlock)( NSError * __nullable error);
typedef void (^WeatherCompletionBlock)(WeatherObj * __nullable weather);
