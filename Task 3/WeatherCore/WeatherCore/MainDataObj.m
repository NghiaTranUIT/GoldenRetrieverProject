//
//  MainDataObj.m
//  WeatherCore
//
//  Created by Nghia Tran on 8/4/17.
//  Copyright © 2017 Nghia Tran. All rights reserved.
//

#import "MainDataObj.h"

@interface MainDataObj()

@property (strong, nonatomic) NSNumber *temp;
@property (strong, nonatomic) NSNumber *pressure;
@property (strong, nonatomic) NSNumber *humidity;
@property (strong, nonatomic) NSNumber *temp_min;
@property (strong, nonatomic) NSNumber *temp_max;


@end

@implementation MainDataObj

+(instancetype) decode:(NSDictionary *)json {
    MainDataObj *obj = [[MainDataObj alloc] init];
    obj.temp = (NSNumber *) json[@"temp"];
    obj.pressure = (NSNumber *) json[@"pressure"];
    obj.humidity = (NSNumber *) json[@"humidity"];
    obj.temp_min = (NSNumber *) json[@"temp_min"];
    obj.temp_max = (NSNumber *) json[@"temp_max"];
    return obj;
}

@end
