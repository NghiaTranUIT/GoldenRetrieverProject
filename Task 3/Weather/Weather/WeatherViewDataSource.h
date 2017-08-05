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


/**
 I define WeatherViewDataSource Protocol

 It represents the data actually need to be display in screen

 If we change UI design in future, we don't need to change in WeatherView
 Just defind the desired variable to be presented.

 */
@protocol WeatherViewDataSource <NSObject>

@property (copy, nonatomic, readonly) NSString *locationName;
@property (copy, nonatomic, readonly) NSString *dateTime;
@property (copy, nonatomic, readonly) NSString *bigIconImageName;
@property (copy, nonatomic, readonly) NSString *temperature;
@property (copy, nonatomic, readonly) NSString *status;
@property (copy, nonatomic, readonly) NSString *cityName;

-(NSArray<id<WeatherAttributeDataSource>> *) weatherAttributes;

@end


/**
 Extend WeatherObj
 */
@interface WeatherObj (WeatherViewDataSource) <WeatherViewDataSource>

@end
