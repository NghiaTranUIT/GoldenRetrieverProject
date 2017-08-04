//
//  SystemDataObj.h
//  WeatherCore
//
//  Created by Nghia Tran on 8/4/17.
//  Copyright © 2017 Nghia Tran. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Decodable.h"

@interface SystemDataObj : NSObject <Decodable>

@property (strong, nonatomic, readonly) NSNumber *type;
@property (strong, nonatomic, readonly) NSNumber *ID;
@property (strong, nonatomic, readonly) NSNumber *message;
@property (strong, nonatomic, readonly) NSNumber *sunrise;
@property (strong, nonatomic, readonly) NSNumber *sunset;
@property (copy, nonatomic, readonly) NSString *country;

@end
