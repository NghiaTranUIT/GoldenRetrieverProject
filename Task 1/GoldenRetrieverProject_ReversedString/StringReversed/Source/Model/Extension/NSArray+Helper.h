//
//  NSArray+Helper.h
//  StringReversed
//
//  Created by Nghia Tran on 8/4/17.
//  Copyright © 2017 Nghia Tran. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSArray (Helpers)

- (NSString *)reduceString:(NSString *)initial combine:(NSString *(^)(NSString *acum, NSString *element))block;

@end
