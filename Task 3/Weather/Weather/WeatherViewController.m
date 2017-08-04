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
#import "LocationWarningView.h"

@interface WeatherViewController ()

@property (strong, nonatomic) WeatherViewModel *viewModel;
@property (strong, nonatomic) WeatherView *weatherView;
@property (strong, nonatomic) LocationWarningView *warningView;

@end

@implementation WeatherViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.viewModel = [[WeatherViewModel alloc] init];

    // Notification
    [self addNotification];
    
    // Layout
    [self setupSubView];

    // Fetch
    [self requestCurrentLocation];
}

-(void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

#pragma mark - Notification
-(void) addNotification {
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(willEnterBackground) name:UIApplicationWillEnterForegroundNotification object:nil];
}

-(void) willEnterBackground {
    [self requestCurrentLocation];
}

#pragma mark - API
-(void) requestCurrentLocation {

    __weak typeof(self) weakSelf = self;
    [self.viewModel requestCurrentLocation:^(CLLocation *location) {
        typeof(self) strongSelf = weakSelf;

        // Hide if need
        [strongSelf.warningView fadeOut];
        
        // Fetch Weather
        [strongSelf fetchWeatherAPI:location];

    } errorBlock:^(NSError * _Nullable error) {
        typeof(self) strongSelf = weakSelf;

        // Show
        [strongSelf.warningView  fadeInWarning:strongSelf.view];
    }];
}

-(void) fetchWeatherAPI:(CLLocation *) location {

    __weak typeof(self) weakSelf = self;
    [self.viewModel fetchWeatherAtLocation:location.coordinate completion:^(WeatherObj * _Nullable weather) {
        typeof(self) strongSelf = weakSelf;

        // Update data
        [strongSelf.weatherView configureViewWithData:weather];
    } error:^(NSError * _Nullable error) {

    }];
}


#pragma mark - Private

-(void) initCommon {

}

-(void) setupSubView {
    [self.weatherView setupView:self.view];
}

-(WeatherView *) lazyWeatherView {
    WeatherView *view = [[NSBundle mainBundle] loadNibNamed:@"WeatherView" owner:nil options:nil].firstObject;
    return view;
}

-(LocationWarningView *) lazyWarningView {
    LocationWarningView *view = [[NSBundle mainBundle] loadNibNamed:@"LocationWarningView" owner:nil options:nil].firstObject;
    return view;
}

#pragma mark - Getter

-(WeatherView *)weatherView {

    if (_weatherView == nil) {
        _weatherView = [self lazyWeatherView];
    }

    return _weatherView;
}

-(LocationWarningView *)warningView {
    if (_warningView == nil) {
        _warningView = [self lazyWarningView];
    }

    return _warningView;
}
@end
