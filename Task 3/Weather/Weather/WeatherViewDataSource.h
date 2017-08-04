//
//  WeatherViewDataSource.h
//  Weather
//
//  Created by Nghia Tran on 8/4/17.
//  Copyright © 2017 Nghia Tran. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <WeatherCore/WeatherCore.h>
#import "WeatherAttributeDataSource.h"

@protocol WeatherViewDataSource <NSObject>

@property (copy, nonatomic, readonly) NSString *locationName;
@property (copy, nonatomic, readonly) NSString *dateTime;
@property (copy, nonatomic, readonly) NSString *bigIconImageName;
@property (copy, nonatomic, readonly) NSString *temperature;
@property (copy, nonatomic, readonly) NSString *status;
@property (copy, nonatomic, readonly) NSString *cityName;


-(NSArray<id<WeatherAttributeDataSource>> *) weatherAttributes;

@end

@interface WeatherObj (WeatherViewDataSource) <WeatherViewDataSource>

@end
