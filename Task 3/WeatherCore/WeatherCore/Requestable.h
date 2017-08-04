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

@protocol Requestable <NSObject>

@property (copy, readonly) NSString *path;
@property (assign, readonly) HTTPMethod httpMethod;
@property (copy, readonly) NSString *baseURL;

-(instancetype) initWithParam:(id<Parammeter>) param;

-(id) decodeObject:(id) response;

-(NSURLRequest *) buildRequest;

-(void) handleCompletion:(id) responseObject;
-(void) handleError:(NSError *) error;

@end
