//
//  WeatherAttributeView.h
//  Weather
//
//  Created by Nghia Tran on 8/4/17.
//  Copyright © 2017 Nghia Tran. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol WeatherAttributeViewData <NSObject>

@property (copy, nonatomic, readonly) NSString *title;
@property (copy, nonatomic, readonly) NSString *value;
@property (copy, nonatomic, readonly) NSString *iconName;

@end

@interface WeatherAttributeView : UIView

-(void) configureCellWithData:(id<WeatherAttributeViewData>) data;

@end
