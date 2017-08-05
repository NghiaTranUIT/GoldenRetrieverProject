//
//  BaseRequest.h
//  WeatherCore
//
//  Created by Nghia Tran on 8/4/17.
//  Copyright © 2017 Nghia Tran. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Requestable.h"
#import "Constants.h"


/**
 Base Request

 Objective-C don't allow us to provide default implementation for Protocol

 It's limitation, to workground it
 I create BaseClass to provide common method

 But we need to find the way to get rid of BaseClass

 */
@interface BaseRequest : NSObject <Requestable>

@property (copy, nonatomic, nullable) CompletionBlock completionBlock;
@property (copy, nonatomic, nullable) ErrorBlock errorBlock;

@end
