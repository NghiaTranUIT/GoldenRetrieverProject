//
//  TextProcessor.h
//  StringReversed
//
//  Created by Nghia Tran on 8/4/17.
//  Copyright © 2017 Nghia Tran. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Middleware.h"
#import "Processor.h"

@interface TextProcessor : NSObject <Processor>


/**
 Init Text Processor with various kind of middleware.
 All of middware must be adapted <Middleware> protocols.

 @param middlewares Array of middleware
 @return Instance of TextProcessor
 */
-(instancetype) initWithMiddleware:(NSArray<Middleware> *) middlewares;


/**
 General method to process text
 Currently, we only support to process data as NSString
 If the future, we can extend it easily.

 @param text Text input
 @return Reversed String
 */
-(NSString *) process:(NSString *) text;

@end
