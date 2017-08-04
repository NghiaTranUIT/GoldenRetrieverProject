//
//  SystemDataObj.m
//  WeatherCore
//
//  Created by Nghia Tran on 8/4/17.
//  Copyright © 2017 Nghia Tran. All rights reserved.
//

#import "SystemDataObj.h"

@interface SystemDataObj ()

@property (strong, nonatomic) NSNumber *type;
@property (strong, nonatomic) NSNumber *ID;
@property (strong, nonatomic) NSNumber *message;
@property (strong, nonatomic) NSNumber *sunrise;
@property (strong, nonatomic) NSNumber *sunset;
@property (copy, nonatomic) NSString *country;

@end

@implementation SystemDataObj

+(instancetype) decode:(NSDictionary *)json {
    SystemDataObj *obj = [[SystemDataObj alloc] init];
    obj.type = (NSNumber *) json[@"type"];
    obj.ID = (NSNumber *) json[@"ID"];
    obj.message = (NSNumber *) json[@"message"];
    obj.sunrise = (NSNumber *) json[@"sunrise"];
    obj.sunset = (NSNumber *) json[@"sunset"];
    obj.country = (NSString *) json[@"country"];
    return obj;
}

@end
