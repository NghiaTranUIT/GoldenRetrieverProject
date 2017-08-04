//
//  DateGlobal.h
//  Weather
//
//  Created by Nghia Tran on 8/5/17.
//  Copyright © 2017 Nghia Tran. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreGraphics/CoreGraphics.h>

@interface DateGlobal : NSObject

+(NSString *) humanHourFromUNIX:(CGFloat) unix;

@end
