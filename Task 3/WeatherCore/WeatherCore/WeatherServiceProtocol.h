//
//  WeatherServiceProtocol.h
//  WeatherCore
//
//  Created by Nghia Tran on 8/5/17.
//  Copyright © 2017 Nghia Tran. All rights reserved.
//

#import <Foundation/Foundation.h>


/**
 Abstract Weather Service
 We can extend our app with new Service as well.

 */
@protocol WeatherServiceProtocol <NSObject>


/**

 Take coordinate2D and fetch Weather Data from desire resource

 @param location Coordinate2D
 @param success SuccessBlock
 @param error Error
 */
-(void) fetchWeatherAtLocation:(CLLocationCoordinate2D) location completion:(WeatherCompletionBlock) success error:(ErrorBlock) error;

@end
