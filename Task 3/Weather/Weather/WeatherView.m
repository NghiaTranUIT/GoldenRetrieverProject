//
//  WeatherView.m
//  Weather
//
//  Created by Nghia Tran on 8/4/17.
//  Copyright © 2017 Nghia Tran. All rights reserved.
//

#import "WeatherView.h"
#import "WeatherAttributeView.h"
#import "NSView+Constraint.h"

@interface WeatherView ()

@property (weak, nonatomic) IBOutlet UILabel *locationNameLbl;
@property (weak, nonatomic) IBOutlet UILabel *dateTimeLbl;
@property (weak, nonatomic) IBOutlet UIImageView *bigIconImageView;
@property (weak, nonatomic) IBOutlet UILabel *temperatureLbl;
@property (weak, nonatomic) IBOutlet UILabel *statusLbl;
@property (weak, nonatomic) IBOutlet UIStackView *stackView;

@end

@implementation WeatherView

-(void) configureViewWithData:(id<WeatherViewDataSource>) data {

    //
    // Fill data from object which adapt with WeatherViewDataSource
    // By using protocol WeatherViewDataSource here
    //
    // WeatherView doesn't depend on any Model Object inside WeatherCore anymore
    self.locationNameLbl.text = data.locationName;
    self.dateTimeLbl.text = data.dateTime;
    self.bigIconImageView.image = [UIImage imageNamed:data.bigIconImageName];
    self.temperatureLbl.text = data.temperature;
    self.statusLbl.text = data.status;

    // Update Stack View
    [self configureStackView:data.weatherAttributes];
}

-(void) configureStackView:(NSArray<id<WeatherAttributeDataSource>> *) attributes {

    // Remove all
    [self.stackView.arrangedSubviews makeObjectsPerformSelector:@selector(removeFromSuperview)];

    // Map to View
    NSArray<WeatherAttributeView *> *attributeViews = [attributes mapObjectsUsingBlock:^id(id<WeatherAttributeDataSource> obj) {

        //
        // We might get rid of boilerplate code here
        // By extendind UIView with <XIBInitialzation> protocol
        //
        // But for now, it's good.
        //
        WeatherAttributeView *view = [[NSBundle mainBundle] loadNibNamed:@"WeatherAttributeView" owner:nil options:nil].firstObject;
        [view configureCellWithData:obj];
        return view;
    }];

    // Add subview
    for (WeatherAttributeView *view in attributeViews) {
        [self.stackView addArrangedSubview:view];
    }
}

-(void) setupView:(UIView *)parentView {

    // Add
    self.translatesAutoresizingMaskIntoConstraints = NO;
    [parentView addSubview:self];

    // Edge
    [self edgeToParentView:parentView];
}

@end
