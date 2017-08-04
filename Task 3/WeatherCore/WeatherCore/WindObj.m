//
//  WindObj.m
//  WeatherCore
//
//  Created by Nghia Tran on 8/4/17.
//  Copyright © 2017 Nghia Tran. All rights reserved.
//

#import "WindObj.h"

@interface WindObj()

@property (strong, nonatomic) NSNumber *speed;
@property (strong, nonatomic) NSNumber *deg;

@end

@implementation WindObj

+(instancetype) decode:(NSDictionary *)json {
    WindObj *obj = [[WindObj alloc] init];
    obj.speed = (NSNumber *) json[@"speed"];
    obj.deg = (NSNumber *) json[@"deg"];
    return obj;
}

@end
