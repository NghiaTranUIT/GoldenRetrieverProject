//
//  CoordinateObj.h
//  WeatherCore
//
//  Created by Nghia Tran on 8/4/17.
//  Copyright © 2017 Nghia Tran. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Decodable.h"

@interface CoordinateObj : NSObject <Decodable>

@property (strong, nonatomic, readonly) NSNumber *lon;
@property (strong, nonatomic, readonly) NSNumber *lat;

@end
