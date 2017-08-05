//
//  Decodable.h
//  WeatherCore
//
//  Created by Nghia Tran on 8/4/17.
//  Copyright © 2017 Nghia Tran. All rights reserved.
//

#import <Foundation/Foundation.h>


/**
 JSON Decodable

 We should implement Decodable by own
 It makes us independency and don't depend on any 3rd parties.

 */
@protocol Decodable <NSObject>

+(instancetype) decode:(NSDictionary *) json;

@end
