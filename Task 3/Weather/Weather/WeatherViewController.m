//
//  WeatherViewController.m
//  Weather
//
//  Created by Nghia Tran on 8/4/17.
//  Copyright © 2017 Nghia Tran. All rights reserved.
//

#import <WeatherCore/WeatherCore.h>
#import <SVProgressHUD/SVProgressHUD.h>
#import "WeatherViewController.h"
#import "WeatherView.h"
#import "LocationWarningView.h"
#import "UIAlertController+Helper.h"

@interface WeatherViewController ()

@property (strong, nonatomic) WeatherViewModel *viewModel;
@property (strong, nonatomic) WeatherView *weatherView;
@property (strong, nonatomic) LocationWarningView *warningView;

@end

@implementation WeatherViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    //
    // Init View model with default service
    //
    // In future, we can provided different Weather Service like Yahoo, Google
    //
    // Please take a look inside WeatherViewModel
    //
    self.viewModel = [[WeatherViewModel alloc] initWithDefaultService];

    //
    // Observe Notification
    // To check Location Permission and fetch data again
    // Make sure it's up-to-date
    //
    [self addNotification];

    //
    // Layout
    // All layout should be responsible by View component instead of deadling directl on Controller
    //
    // A dream Controller should only coordinate data-flow
    [self setupSubView];

    //
    // Fetch
    // Try to request current location
    //
    [self requestCurrentLocation];
}

-(void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

#pragma mark - Notification
-(void) addNotification {

    //
    // Observe Enter Backtround Notification
    // Because if user goes to Setting to enable Location Service or give permission
    // then back to our app
    //
    // Here is place to check it
    //
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(willEnterForeground) name:UIApplicationWillEnterForegroundNotification object:nil];
}

-(void) willEnterForeground {
    [self requestCurrentLocation];
}

#pragma mark - API
-(void) requestCurrentLocation {

    //
    // Try to fetch location
    // and Permission
    //
    // Personally I don't want to use Callback block. It's reasons cause nested-callback
    // I prefer Promise approach
    // or RxSwift
    //
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
        [strongSelf.warningView fadeInWarning:strongSelf.view];
    }];
}

-(void) fetchWeatherAPI:(CLLocation *) location {

    // Loader
    [SVProgressHUD show];

    //
    // Fetch Weather from Model
    //
    // Let imagine
    // Actually Weather App doesn't need to care about OpenWeatherService or YahooService anymore
    //
    // In future, we probably suppot various WeatherService
    // As a result, we don't need to modify this code
    //
    __weak typeof(self) weakSelf = self;
    [self.viewModel fetchWeatherAtLocation:location.coordinate completion:^(WeatherObj * _Nullable weather) {
        typeof(self) strongSelf = weakSelf;

        // Dismiss
        [SVProgressHUD dismiss];

        // Update data
        [strongSelf.weatherView configureViewWithData:weather];
    } error:^(NSError * _Nullable error) {
        typeof(self) strongSelf = weakSelf;
        [UIAlertController presentAlertControllerWithMessage:@"Something went wrong" rootController:strongSelf];
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
