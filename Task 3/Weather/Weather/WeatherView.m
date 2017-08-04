//
//  WeatherView.m
//  Weather
//
//  Created by Nghia Tran on 8/4/17.
//  Copyright © 2017 Nghia Tran. All rights reserved.
//

#import "WeatherView.h"
#import "WeatherAttributeView.h"

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

    // Update data
    self.locationNameLbl.text = data.locationName;
    self.dateTimeLbl.text = data.dateTime;
    self.bigIconImageView.image = [UIImage imageNamed:data.bigIconImageName];
    self.temperatureLbl.text = data.temperature;
    self.statusLbl.text = data.status;
    self.cityNameLbl.text = data.cityName;

    // Update Stack View
    [self configureStackView:data.weatherAttributes];
}

-(void) configureStackView:(NSArray<id<WeatherAttributeDataSource>> *) attributes {

    // Remove all
    [self.stackView.arrangedSubviews makeObjectsPerformSelector:@selector(removeFromSuperview)];

    // Map to View
    NSArray<WeatherAttributeView *> *attributeViews = [attributes mapObjectsUsingBlock:^id(id<WeatherAttributeDataSource> obj) {
        WeatherAttributeView *view = [[NSBundle mainBundle] loadNibNamed:@"WeatherAttributeView" owner:nil options:nil].firstObject;
        [view configureCellWithData:obj];
        return view;
    }];

    // Add subview
    for (WeatherAttributeView *view in attributeViews) {
        [self.stackView addArrangedSubview:view];
    }
}

@end
