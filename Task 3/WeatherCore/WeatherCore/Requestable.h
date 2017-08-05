//
//  Requestable.h
//  WeatherCore
//
//  Created by Nghia Tran on 8/4/17.
//  Copyright © 2017 Nghia Tran. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Parammeter.h"

typedef enum : NSUInteger {
    HTTPMethodGET = 0,
    HTTPMethodPOST,
    HTTPMethodPUT
} HTTPMethod;


/**
 Requestable protocol
 Define all property or methods involves to build appropriate request

 Because we probably ship our SDK to the developer over the world in the future.
 It means SWIFT developer might use it as well.

 Make it's more flexible if someone would like to use Struct (SWIFT)

 */
@protocol Requestable <NSObject>

// Path
@property (copy, readonly) NSString *path;

// HTTP Method
@property (assign, readonly) HTTPMethod httpMethod;

// Base URL
@property (copy, readonly) NSString *baseURL;

/**
 Initializer request with pappropriate request.

 @param param Object / Struct (swift) which adapted <Parammeter>
 @return Request instance
 */
-(instancetype) initWithParam:(id<Parammeter>) param;


/**
 Decode object

 We define what kind of object or how to decode object in Request here.
 Maybe it looks like silly when encapsulating Decode object into Request

 But for now, it's good.

 In future, we might create <JSONDecodeable> to handle JSONDecode

 @param response Response from Data Task
 @return Decoded Object
 */
-(id) decodeObject:(id) response;


/**
 Abstract method to build NSURLRequest

 @return Request
 */
-(NSURLRequest *) buildRequest;


/**
 Completion Block

 @param responseObject Response Data
 */
-(void) handleCompletion:(id) responseObject;


/**
 Error Block

 @param error Error Obj
 */
-(void) handleError:(NSError *) error;

@end
