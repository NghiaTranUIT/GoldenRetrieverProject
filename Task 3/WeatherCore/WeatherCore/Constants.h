//
//  Constants.h
//  WeatherCore
//
//  Created by Nghia Tran on 8/4/17.
//  Copyright © 2017 Nghia Tran. All rights reserved.
//

@class CLLocation;

static NSString *const __nonnull k_API_ROOT = @"http://";
static NSString *const __nonnull k_API_BASE = @"api.openweathermap.org";
static NSString *const __nonnull k_API_WEATHER = @"/data/2.5/weather";

@class WeatherObj;

typedef void (^CompletionBlock)(__nullable id obj);
typedef void (^ErrorBlock)( NSError * __nullable error);
typedef void (^WeatherCompletionBlock)(WeatherObj * __nullable weather);

// Location
typedef void (^LocationBlock)(CLLocation *_Nullable);
typedef void (^LocationPermissionSuccess)(void);

// API
static NSString * _Nonnull const OpenWeatherAppID = @"95b9c4a2db2733275c713317d9961522";
