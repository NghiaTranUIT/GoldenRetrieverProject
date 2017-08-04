//
//  WeatherAttributeViewDataSource.h
//  Weather
//
//  Created by Nghia Tran on 8/4/17.
//  Copyright © 2017 Nghia Tran. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <WeatherCore/WeatherCore.h>

@protocol WeatherAttributeDataSource <NSObject>

@property (copy, nonatomic, readonly) NSString *title;
@property (copy, nonatomic, readonly) NSString *value;
@property (copy, nonatomic, readonly) NSString *iconName;

@end

@interface SystemDataObj (WeatherAttributeDataSource) <WeatherAttributeDataSource>

@end

@interface WindObj (WeatherAttributeDataSource) <WeatherAttributeDataSource>

@end

@interface MainDataObj (WeatherAttributeDataSource) <WeatherAttributeDataSource>

@end
