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

/**
 Location Service
 */
@interface LocationService : NSObject


/**
 Singleton instance

 In future, we can eliminate it

 @return Instance
 */
+(instancetype) shareInstance;


/**
 Get authorizationStatus

 @return CLAuthorizationStatus
 */
+(CLAuthorizationStatus) authorizationStatus;


/**
 Get locationServicesEnabled

 @return Bool
 */
+(BOOL) locationServicesEnabled;


/**
 Request "when-in-use" authorization

 @param block CompletionBlock
 */
-(void) requestWhenInUseAuthorization:(LocationPermissionSuccess) block;


/**
 Fetch current location

 @param block Completion Block
 @param error Error Block
 */
-(void) fetchLocation:(LocationBlock) block errorBlock:(ErrorBlock) error;

@end
