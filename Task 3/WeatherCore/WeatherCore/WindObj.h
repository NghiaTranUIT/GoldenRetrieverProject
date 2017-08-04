//
//  WindObj.h
//  WeatherCore
//
//  Created by Nghia Tran on 8/4/17.
//  Copyright © 2017 Nghia Tran. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Decodable.h"

@interface WindObj : NSObject <Decodable>

@property (strong, nonatomic, readonly) NSNumber *speed;
@property (strong, nonatomic, readonly) NSNumber *deg;

@end
