//
//  WeatherView.h
//  Weather
//
//  Created by Nghia Tran on 8/4/17.
//  Copyright © 2017 Nghia Tran. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WeatherViewDataSource.h"


/**
 Main Weather View
 */
@interface WeatherView : UIView


/**
 Setup View with appropriate NSConstraints

 @param parentView Parent View
 */
-(void) setupView:(UIView *) parentView;


/**
 Fill data which defined at WeatherViewDataSource

 @param data Data
 */
-(void) configureViewWithData:(id<WeatherViewDataSource>) data;

@end
