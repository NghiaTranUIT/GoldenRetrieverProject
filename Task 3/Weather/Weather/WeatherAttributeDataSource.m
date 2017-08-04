//
//  WeatherAttributeViewDataSource.m
//  Weather
//
//  Created by Nghia Tran on 8/4/17.
//  Copyright © 2017 Nghia Tran. All rights reserved.
//

#import "WeatherAttributeDataSource.h"

@implementation SystemDataObj (WeatherAttributeDataSource)

-(NSString *)title {
    return @"SUNRISE";
}

-(NSString *)value {
    return [NSString stringWithFormat:@"%@", self.sunrise];
}

-(NSString *)iconName {
    return @"icon_sunrise";
}

@end

@implementation WindObj (WeatherAttributeDataSource)

-(NSString *)title {
    return @"WIND";
}

-(NSString *)value {
    return [NSString stringWithFormat:@"%@", self.speed];
}

-(NSString *)iconName {
    return @"icon_wind";
}

@end

@implementation MainDataObj (WeatherAttributeDataSource)

-(NSString *)title {
    return @"TEMPERATURE";
}

-(NSString *)value {
    return [NSString stringWithFormat:@"%@", self.temp];
}

-(NSString *)iconName {
    return @"icon_temp";
}

@end
