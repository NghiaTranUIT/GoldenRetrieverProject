//
//  WeatherAttributeViewDataSource.h
//  Weather
//
//  Created by Nghia Tran on 8/4/17.
//  Copyright © 2017 Nghia Tran. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <WeatherCore/WeatherCore.h>


/**
 It represents the data actually need to be display in screen

 If we change UI design in future, we don't need to change in WeatherAttributeView
 Just defind the desired variable to be presented.

 */
@protocol WeatherAttributeDataSource <NSObject>

@property (copy, nonatomic, readonly) NSString *title;
@property (copy, nonatomic, readonly) NSString *value;
@property (copy, nonatomic, readonly) NSString *iconName;

@end


/**
 Extend SystemDataObj
 */
@interface SystemDataObj (WeatherAttributeDataSource) <WeatherAttributeDataSource>

@end

/**
 Extend WindObj
 */
@interface WindObj (WeatherAttributeDataSource) <WeatherAttributeDataSource>

@end

/**
 Extend MainDataObj
 */
@interface MainDataObj (WeatherAttributeDataSource) <WeatherAttributeDataSource>

@end
