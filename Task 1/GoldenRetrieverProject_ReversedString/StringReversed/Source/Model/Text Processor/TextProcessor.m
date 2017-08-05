//
//  TextProcessor.m
//  StringReversed
//
//  Created by Nghia Tran on 8/4/17.
//  Copyright © 2017 Nghia Tran. All rights reserved.
//

#import "TextProcessor.h"
#import "Middleware.h"

@interface TextProcessor()

@property (strong, nonatomic) NSArray<Middleware> *middlewares;

@end

@implementation TextProcessor

-(instancetype) initWithMiddleware:(NSArray<Middleware> *)middlewares {
    self = [super init];

    // Store middleware
    if (self) {
        self.middlewares = middlewares;
    }

    return self;
}
-(NSString *) process:(NSString *) text {

    // Copy
    // Best practice when dealing with NSString
    NSString *result = [text copy];

    //
    // Following SOLID pricinple
    //
    // In future, if we add new middleware, we don't need to edit this method anymore.
    // It's really elegant way, insteand of coding hardcode StringReversedMiddware
    for (id obj in self.middlewares) {

        id<Middleware> middle = obj;

        // As each middle which is adapted <Middleware>
        // It has -process method.
        result = [middle process:result];
    }

    return result;
}

@end
