//
//  WeatherAttributeViewDataSource.m
//  Weather
//
//  Created by Nghia Tran on 8/4/17.
//  Copyright © 2017 Nghia Tran. All rights reserved.
//

#import "WeatherAttributeDataSource.h"
#import "DateGlobal.h"

@implementation SystemDataObj (WeatherAttributeDataSource)

-(NSString *)title {
    return @"SUNRISE";
}

-(NSString *)value {
    return [DateGlobal humanHourFromUNIX:self.sunrise.floatValue];
}

-(NSString *)iconName {
    return @"icon_attribute_sun";
}

@end

@implementation WindObj (WeatherAttributeDataSource)

-(NSString *)title {
    return @"WIND";
}

-(NSString *)value {
    return [NSString stringWithFormat:@"%.02f m/s", [self.speed floatValue]];
}

-(NSString *)iconName {
    return @"icon_attribute_wind";
}

@end

@implementation MainDataObj (WeatherAttributeDataSource)

-(NSString *)title {
    return @"TEMPERATURE";
}

-(NSString *)value {
    return [NSString stringWithFormat:@"%ld°F", (long)[self.temp integerValue]];
}

-(NSString *)iconName {
    return @"icon_attribute_temp";
}

@end
