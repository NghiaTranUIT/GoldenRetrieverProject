//
//  WeatherAttributeView.h
//  Weather
//
//  Created by Nghia Tran on 8/4/17.
//  Copyright © 2017 Nghia Tran. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WeatherAttributeDataSource.h"

@interface WeatherAttributeView : UIView

-(void) configureCellWithData:(id<WeatherAttributeDataSource>) data;

@end
