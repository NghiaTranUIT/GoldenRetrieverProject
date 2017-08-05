//
//  Processor.h
//  StringReversed
//
//  Created by Nghia Tran on 8/4/17.
//  Copyright © 2017 Nghia Tran. All rights reserved.
//

#import <Foundation/Foundation.h>


@protocol Processor <NSObject>

-(NSString *) process:(NSString *) text;

@end
