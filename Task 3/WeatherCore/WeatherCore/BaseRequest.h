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

@interface BaseRequest : NSObject <Requestable>

@property (copy, nonatomic, nullable) CompletionBlock completionBlock;
@property (copy, nonatomic, nullable) ErrorBlock errorBlock;

@end
