//
//  NetworkService.h
//  WeatherCore
//
//  Created by Nghia Tran on 8/4/17.
//  Copyright © 2017 Nghia Tran. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Requestable.h"

typedef id (^CompletionBlock)(id obj);
typedef id (^ErrorBlock)(NSError *error);

@interface NetworkService : NSObject

// Init service with URLSession
// Support injection dependency
-(instancetype) initWithURLSession:(NSURLSession *) session;

// Execute all request
-(void) executeRequest:(id<Requestable>) request;

@end
