//
//  CoordinateObj.m
//  WeatherCore
//
//  Created by Nghia Tran on 8/4/17.
//  Copyright © 2017 Nghia Tran. All rights reserved.
//

#import "CoordinateObj.h"

@interface CoordinateObj()

@property (strong, nonatomic) NSNumber *lon;
@property (strong, nonatomic) NSNumber *lat;

@end

@implementation CoordinateObj

+(instancetype) decode:(NSDictionary *)json {
    CoordinateObj *obj = [[CoordinateObj alloc] init];
    obj.lat = (NSNumber *) json[@"lat"];
    obj.lon = (NSNumber *) json[@"lon"];
    return obj;
}

@end
