//
//  WeatherAttributeView.m
//  Weather
//
//  Created by Nghia Tran on 8/4/17.
//  Copyright © 2017 Nghia Tran. All rights reserved.
//

#import "WeatherAttributeView.h"

@interface WeatherAttributeView ()

@property (weak, nonatomic) IBOutlet UILabel *titleLbl;
@property (weak, nonatomic) IBOutlet UIImageView *iconImageView;
@property (weak, nonatomic) IBOutlet UILabel *valueLbl;

@end

@implementation WeatherAttributeView

-(void) configureCellWithData:(id<WeatherAttributeViewData>) data {

    // Layout data
    self.titleLbl.text = data.title;
    self.valueLbl.text = data.value;
    self.iconImageView.image = [UIImage imageNamed:data.iconName];
}

@end
