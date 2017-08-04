//
//  LocationService.h
//  WeatherCore
//
//  Created by Nghia Tran on 8/4/17.
//  Copyright © 2017 Nghia Tran. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>
#import "Constants.h"

// Location
typedef void (^LocationBlock)(CLLocation *);
typedef void (^LocationPermissionSuccess)();

@interface LocationService : NSObject

+(instancetype) shareInstance;

+(CLAuthorizationStatus) authorizationStatus;
+(BOOL) locationServicesEnabled;

-(void) requestWhenInUseAuthorization:(LocationPermissionSuccess) block;
-(void) fetchLocation:(LocationBlock) block errorBlock:(ErrorBlock) error;

@end
