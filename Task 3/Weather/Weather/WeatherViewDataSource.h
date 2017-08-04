//
//  WeatherViewDataSource.h
//  Weather
//
//  Created by Nghia Tran on 8/4/17.
//  Copyright © 2017 Nghia Tran. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <WeatherCore/WeatherCore.h>
#import "WeatherView.h"

@protocol WeatherViewDataSource <NSObject>

@property (copy, nonatomic, readonly) NSString *title;

@end


@interface WeatherObj (WeatherViewDataSource) <WeatherViewDataSource>

@end
