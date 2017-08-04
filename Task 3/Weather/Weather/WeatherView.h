//
//  WeatherView.h
//  Weather
//
//  Created by Nghia Tran on 8/4/17.
//  Copyright © 2017 Nghia Tran. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WeatherViewDataSource.h"

@interface WeatherView : UIView

-(void) setupView:(UIView *) parentView;

-(void) configureViewWithData:(id<WeatherViewDataSource>) data;

@end
