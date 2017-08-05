//
//  WeatherObj.m
//  WeatherCore
//
//  Created by Nghia Tran on 8/4/17.
//  Copyright © 2017 Nghia Tran. All rights reserved.
//

#import "WeatherObj.h"
#import "CoordinateObj.h"
#import "WeatherDataObj.h"
#import "MainDataObj.h"
#import "WindObj.h"
#import "CloudObj.h"
#import "SystemDataObj.h"
#import "NSArray+Map.h"

@interface WeatherObj ()

@property (strong, nonatomic) CoordinateObj *coordinate;
@property (strong, nonatomic) NSArray<WeatherDataObj *> *weatherDatas;
@property (strong, nonatomic) MainDataObj *mainData;
@property (strong, nonatomic) WindObj *wind;
@property (strong, nonatomic) CloudObj *cloud;
@property (strong, nonatomic) SystemDataObj *systemData;

@property (strong, nonatomic) NSNumber *ID;
@property (copy, nonatomic) NSString *name;
@property (strong, nonatomic) NSNumber *cod;
@property (strong, nonatomic) NSNumber *dt;
@property (copy, nonatomic) NSString *base;

@end

@implementation WeatherObj


/**
 Decode JSON

 @param json JSON Dictionary
 @return WeatherObj Instance
 */
+(instancetype) decode:(NSDictionary *)json {
    WeatherObj *obj = [[WeatherObj alloc] init];

    obj.coordinate = [CoordinateObj decode: json[@"coor"]];
    obj.mainData = [MainDataObj decode: json[@"main"]];
    obj.wind = [WindObj decode: json[@"wind"]];
    obj.cloud = [CloudObj decode: json[@"clouds"]];
    obj.systemData = [SystemDataObj decode: json[@"sys"]];

    obj.ID = (NSNumber *) json[@"id"];
    obj.name = (NSString *) json[@"name"];
    obj.cod = (NSNumber *) json[@"cod"];
    obj.dt = (NSNumber *) json[@"dt"];
    obj.base = (NSString *) json[@"base"];

    NSArray *weathes = json[@"weather"];
    if (weathes != nil) {

        // Using map instead foreach
        // I prefer this one
        obj.weatherDatas = [weathes mapObjectsUsingBlock:^id(id obj) {
            return [WeatherDataObj decode:(NSDictionary *) obj];
        }];
    }

    return obj;
}

@end
