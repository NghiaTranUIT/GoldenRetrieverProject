//
//  CloudObj.m
//  WeatherCore
//
//  Created by Nghia Tran on 8/4/17.
//  Copyright © 2017 Nghia Tran. All rights reserved.
//

#import "CloudObj.h"

@interface CloudObj ()

@property (strong, nonatomic) NSNumber *all;

@end

@implementation CloudObj

+(instancetype) decode:(NSDictionary *)json {
    CloudObj *obj = [[CloudObj alloc] init];
    obj.all = (NSNumber *) json[@"all"];
    return obj;
}

@end
