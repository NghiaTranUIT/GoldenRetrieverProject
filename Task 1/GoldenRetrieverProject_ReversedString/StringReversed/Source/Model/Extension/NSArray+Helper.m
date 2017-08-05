//
//  NSArray+Helper.m
//  StringReversed
//
//  Created by Nghia Tran on 8/4/17.
//  Copyright © 2017 Nghia Tran. All rights reserved.
//

#import "NSArray+Helper.h"

@implementation NSArray (Helpers)

- (NSString *)reduceString:(NSString *)initial combine:(NSString *(^)(NSString *acum, NSString *element))block {
    if (!self) {
        return initial;
    }

    NSString *acum = [initial copy];
    for (id element in self) {
        if ([element isKindOfClass:[NSString class]]) {
            acum = block(acum, (NSString *) element);
        }
    }

    return acum;
}

@end
