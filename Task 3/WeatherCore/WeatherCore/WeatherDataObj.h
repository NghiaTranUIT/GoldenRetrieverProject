//
//  WeatherDataObj.h
//  WeatherCore
//
//  Created by Nghia Tran on 8/4/17.
//  Copyright © 2017 Nghia Tran. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WeatherDataObj : NSObject

@property (assign, nonatomic, readonly) NSInteger ID;
@property (copy, nonatomic, readonly) NSString *_description;
@property (copy, nonatomic, readonly) NSString *main;
@property (copy, nonatomic, readonly) NSString *icon;

@end
