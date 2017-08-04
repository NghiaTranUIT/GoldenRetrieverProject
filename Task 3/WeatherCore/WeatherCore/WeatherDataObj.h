//
//  WeatherDataObj.h
//  WeatherCore
//
//  Created by Nghia Tran on 8/4/17.
//  Copyright © 2017 Nghia Tran. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Decodable.h"

@interface WeatherDataObj : NSObject <Decodable>

@property (strong, nonatomic, readonly) NSNumber *ID;
@property (copy, nonatomic, readonly) NSString *_description;
@property (copy, nonatomic, readonly) NSString *main;
@property (copy, nonatomic, readonly) NSString *icon;

@end
