//
//  WeatherView.h
//  Weather
//
//  Created by Nghia Tran on 8/4/17.
//  Copyright © 2017 Nghia Tran. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol WeatherViewDataSource <NSObject>

@property (copy, nonatomic, readonly) NSString *title;

@end

@interface WeatherView : UIView

-(void) configureViewWithData:(id<WeatherViewDataSource>) data;

@end
