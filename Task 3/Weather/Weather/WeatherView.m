//
//  WeatherView.m
//  Weather
//
//  Created by Nghia Tran on 8/4/17.
//  Copyright © 2017 Nghia Tran. All rights reserved.
//

#import "WeatherView.h"

@interface WeatherView ()

@property (weak, nonatomic) IBOutlet UILabel *locationNameLbl;
@property (weak, nonatomic) IBOutlet UILabel *dateTimeLbl;
@property (weak, nonatomic) IBOutlet UIImageView *bigIconImageView;
@property (weak, nonatomic) IBOutlet UILabel *temperatureLbl;
@property (weak, nonatomic) IBOutlet UILabel *statusLbl;
@property (weak, nonatomic) IBOutlet UILabel *cityNameLbl;
@property (weak, nonatomic) IBOutlet UIStackView *stackView;

@end

@implementation WeatherView

-(void) configureViewWithData:(id<WeatherViewDataSource>) data {

}

@end
