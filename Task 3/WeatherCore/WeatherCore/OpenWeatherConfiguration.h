//
//  OpenWeatherConfiguration.h
//  WeatherCore
//
//  Created by Nghia Tran on 8/4/17.
//  Copyright © 2017 Nghia Tran. All rights reserved.
//

#import <Foundation/Foundation.h>


/**
 Provide the cozy place we can provide configuration for OpenWeatherService
 */
@interface OpenWeatherConfiguration : NSObject

@property (copy, nonatomic, readonly) NSString *appID;

@end
