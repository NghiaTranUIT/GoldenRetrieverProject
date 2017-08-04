//
//  Requestable.h
//  WeatherCore
//
//  Created by Nghia Tran on 8/4/17.
//  Copyright © 2017 Nghia Tran. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Parammeter.h"

@protocol Requestable <NSObject>

@property (copy, readonly) NSString *path;

-(instancetype) initWithParam:(id<Parammeter>) param;

-(NSURLRequest *) buildRequest;

@end
