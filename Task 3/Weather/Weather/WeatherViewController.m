//
//  WeatherViewController.m
//  Weather
//
//  Created by Nghia Tran on 8/4/17.
//  Copyright © 2017 Nghia Tran. All rights reserved.
//

#import "WeatherViewController.h"
#import <WeatherCore/WeatherCore.h>
#import "WeatherView.h"

@interface WeatherViewController ()

@property (strong, nonatomic) WeatherViewModel *viewModel;
@property (strong, nonatomic) WeatherView *weatherView;

@end

@implementation WeatherViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.viewModel = [[WeatherViewModel alloc] init];

    // Fetch
    [self fetchWeatherAPI];
}


#pragma mark - API
-(void) fetchWeatherAPI {

    CLLocationCoordinate2D location = CLLocationCoordinate2DMake(10.762622, 106.660172);

    __weak typeof(self) weakSelf = self;
    [self.viewModel fetchWeatherAtLocation:location completion:^void(WeatherObj *weather) {
        typeof(self) strongSelf = weakSelf;

        // Update data
        [strongSelf.weatherView configureViewWithData:weather];
    }];
}


#pragma mark - Private

-(void) initCommon {

}

-(WeatherView *) lazyWeatherView {
    WeatherView *view = [[NSBundle mainBundle] loadNibNamed:@"WeatherView" owner:nil options:nil].firstObject;
    return view;
}

#pragma mark - Getter

-(WeatherView *)weatherView {

    if (_weatherView == nil) {
        _weatherView = [self lazyWeatherView];
    }

    return _weatherView;
}

@end
