//
//  NSArray+Map.h
//  WeatherCore
//
//  Created by Nghia Tran on 8/4/17.
//  Copyright © 2017 Nghia Tran. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef id (^MapObjectBlock)(id obj);


/**
 Map method from Swift
 */
@interface NSArray (Map)

- (NSArray *)mapObjectsUsingBlock:(MapObjectBlock)block;

@end
