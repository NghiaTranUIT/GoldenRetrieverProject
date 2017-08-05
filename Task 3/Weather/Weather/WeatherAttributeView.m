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

-(void) configureCellWithData:(id<WeatherAttributeDataSource>) data {

    //
    // Fill data
    //
    // By using protocol WeatherAttributeDataSource here
    //
    // WeatherAttributeView doesn't depend on any Model Object inside WeatherCore anymore
    //
    // It means we doesn't need to modify this code if we change the ModelObject

    self.titleLbl.text = data.title;
    self.valueLbl.text = data.value;
    self.iconImageView.image = [UIImage imageNamed:data.iconName];
}

@end
