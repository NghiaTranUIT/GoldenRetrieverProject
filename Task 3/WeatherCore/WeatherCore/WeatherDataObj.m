//
//  WeatherDataObj.m
//  WeatherCore
//
//  Created by Nghia Tran on 8/4/17.
//  Copyright © 2017 Nghia Tran. All rights reserved.
//

#import "WeatherDataObj.h"

@interface WeatherDataObj()

@property (strong, nonatomic) NSNumber *ID;
@property (copy, nonatomic) NSString *_description;
@property (copy, nonatomic) NSString *main;
@property (copy, nonatomic) NSString *icon;

@end

@implementation WeatherDataObj

+(instancetype) decode:(NSDictionary *)json {
    WeatherDataObj *obj = [[WeatherDataObj alloc] init];
    obj._description = (NSString *) json[@"description"];
    obj.ID = (NSNumber *) json[@"ID"];
    obj.main = (NSString *) json[@"main"];
    obj.icon = (NSString *) json[@"icon"];
    return obj;
}

-(WeatherType) weatherType {

    // Getname
    NSString *name = self.main.lowercaseString;

    // Guard
    if (name == nil) {
        return WeatherTypeNice;
    }

    if ([name isEqualToString:@"clouds"]) {
        return WeatherTypeNice;
    }

    if ([name isEqualToString:@"snowy"]) {
        return WeatherTypeSnowy;
    }

    if ([name isEqualToString:@"storm"]) {
        return WeatherTypeStorm;
    }

    return WeatherTypeNice;
}

-(NSString *) iconWeatherName {
    switch (self.weatherType) {
        case WeatherTypeStorm:
            return @"icon_storm";
        case WeatherTypeSnowy:
            return @"icon_snowy";
        case WeatherTypeRainy:
            return @"icon_rainy";
        case WeatherTypeNice:
            return @"icon_normal";
    }
}
@end
