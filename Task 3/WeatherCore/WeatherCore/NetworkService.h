//
//  NetworkService.h
//  WeatherCore
//
//  Created by Nghia Tran on 8/4/17.
//  Copyright © 2017 Nghia Tran. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Requestable.h"


/**
 Network Service
 Dealing directly with NSURLSession or external resource

 It provides method to fetch data from Internet.

 */
@interface NetworkService : NSObject

// Init service with URLSession
// Support injection dependency
-(instancetype) initWithURLSession:(NSURLSession *) session;

/**
 Execute all request

 @param request Object or struct (SWIFT) are adapted with Requestable protocol
 */
-(void) executeRequest:(id<Requestable>) request;

@end
