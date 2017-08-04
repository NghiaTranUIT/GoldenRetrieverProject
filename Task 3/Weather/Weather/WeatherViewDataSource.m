//
//  WeatherViewDataSource.m
//  Weather
//
//  Created by Nghia Tran on 8/4/17.
//  Copyright © 2017 Nghia Tran. All rights reserved.
//

#import "WeatherViewDataSource.h"

@implementation WeatherObj (WeatherViewDataSource)

-(NSString *)locationName {
    return self.name;
}

-(NSString *)dateTime {
    return @"TUEDAYS 9:00AM";
}

-(NSString *)bigIconImageName {
    WeatherDataObj *obj = self.weatherDatas.firstObject;
    return [obj iconWeatherName];
}

-(NSString *)temperature {
    return [NSString stringWithFormat:@"%@", self.mainData.temp];
}

-(NSString *)status {

    // Nil
    WeatherDataObj *data = self.weatherDatas.firstObject;
    if (data == nil) {
        return @"Unknown";
    }

    return [NSString stringWithFormat:@"%@", data.main];
}

-(NSString *)cityName {
    return self.systemData.country;
}

-(NSArray<id<WeatherAttributeDataSource>> *)weatherAttributes {
    return @[self.wind, self.systemData, self.mainData];
}

@end
