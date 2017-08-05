//
//  StringReversedMiddleware.m
//  StringReversed
//
//  Created by Nghia Tran on 8/4/17.
//  Copyright © 2017 Nghia Tran. All rights reserved.
//

#import "StringReversedMiddleware.h"
#import "NSArray+Helper.h"

@implementation StringReversedMiddleware

-(nonnull NSString *) process:(nonnull NSString *) text {

    // Split each character to array
    NSMutableArray<NSString *> *stringComponents = [[self toArray:text] mutableCopy];

    // Prepare data
    NSUInteger length = stringComponents.count;
    NSUInteger halfPoint = length / 2;

    // Swap first character to last character
    // And goes to the half point
    // It saves haft of time
    //
    // Gererally, Althought time complexity = O(n). But actually it's n/2
    // with n is lengh of text

    for (NSUInteger i = 0; i < halfPoint; i++) {
        NSString *temp = stringComponents[i];
        NSUInteger indicator = length - 1 - i;

        // Swap
        // Copy string to make sure we can't avoid to mess up with pointer problem when swap
        stringComponents[i] = [stringComponents[indicator] copy];
        stringComponents[indicator] = [temp copy];
    }

    // Build reversed string
    NSString *result = [self buildStringFromArray:stringComponents];
    return result;
}

-(NSArray<NSString *> *) toArray:(NSString *) text {

    // Prepare
    NSRange range = NSMakeRange(0, [text length]);
    NSMutableArray<NSString *> *result = [@[] mutableCopy];

    // We can't iterate each character in range of text.length
    // It's incorrect because emoji or special character are counted as 2

    // The best solution is use built-in method enumerateSubstringsInRange
    // Handle emoji and special characters appropriate
    [text enumerateSubstringsInRange: range
                                  options:NSStringEnumerationByComposedCharacterSequences
                               usingBlock:^(NSString *substring, NSRange substringRange, NSRange enclosingRange, BOOL *stop) {
                                   [result addObject:substring];
                               }];
    return [result copy];
}

-(NSString *) buildStringFromArray:(NSArray<NSString *> *) stringComponents {

    // Reduce from Swift
    // I prefer to use Map / Reduce / Filter as possible
    return [stringComponents reduceString:@"" combine:^NSString *(NSString *acum, NSString *element) {
        return [NSString stringWithFormat:@"%@%@", acum, element];
    }];
}

@end



