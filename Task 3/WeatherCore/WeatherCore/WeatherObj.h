//
//  WeatherObj.h
//  WeatherCore
//
//  Created by Nghia Tran on 8/4/17.
//  Copyright © 2017 Nghia Tran. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Decodable.h"

@class CoordinateObj;
@class MainDataObj;
@class MainDataObj;
@class WindObj;
@class CloudObj;
@class SystemDataObj;
@class WeatherDataObj;

/**
 WeatherObj represents data from API
 */
@interface WeatherObj : NSObject <Decodable>

@property (strong, nonatomic, readonly) CoordinateObj *coordinate;
@property (strong, nonatomic, readonly) NSArray<WeatherDataObj *> *weatherDatas;
@property (strong, nonatomic, readonly) MainDataObj *mainData;
@property (strong, nonatomic, readonly) WindObj *wind;
@property (strong, nonatomic, readonly) CloudObj *cloud;
@property (strong, nonatomic, readonly) SystemDataObj *systemData;

@property (strong, nonatomic, readonly) NSNumber *ID;
@property (copy, nonatomic, readonly) NSString *name;
@property (strong, nonatomic, readonly) NSNumber *cod;
@property (strong, nonatomic, readonly) NSNumber *dt;
@property (copy, nonatomic, readonly) NSString *base;

@end
