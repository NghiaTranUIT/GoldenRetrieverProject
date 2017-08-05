//
//  Parammeter.h
//  WeatherCore
//
//  Created by Nghia Tran on 8/4/17.
//  Copyright © 2017 Nghia Tran. All rights reserved.
//

#import <Foundation/Foundation.h>


/**
 Parammeter protocol

 Make the worl more flexible if we ship our SDK to Swift world
 */
@protocol Parammeter <NSObject>


/**
 Build appropriate param/

 @return NSDictionary
 */
-(NSDictionary <NSString *, id> *) buildParam;

@end
