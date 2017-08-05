//
//  WeatherAttributeView.h
//  Weather
//
//  Created by Nghia Tran on 8/4/17.
//  Copyright © 2017 Nghia Tran. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WeatherAttributeDataSource.h"


/**
 WeatherAttributeView
 */
@interface WeatherAttributeView : UIView


/**
 Fill data with object or struct (swift) which adapt WeatherAttributeDataSource protocol

 @param data Data
 */
-(void) configureCellWithData:(id<WeatherAttributeDataSource>) data;

@end
