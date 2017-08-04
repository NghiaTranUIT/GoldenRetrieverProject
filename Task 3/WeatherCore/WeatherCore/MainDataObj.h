//
//  MainDataObj.h
//  WeatherCore
//
//  Created by Nghia Tran on 8/4/17.
//  Copyright © 2017 Nghia Tran. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Decodable.h"

@interface MainDataObj : NSObject <Decodable>

@property (strong, nonatomic, readonly) NSNumber *temp;
@property (strong, nonatomic, readonly) NSNumber *pressure;
@property (strong, nonatomic, readonly) NSNumber *humidity;
@property (strong, nonatomic, readonly) NSNumber *temp_min;
@property (strong, nonatomic, readonly) NSNumber *temp_max;

@end
