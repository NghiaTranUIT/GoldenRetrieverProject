//
//  WeatherViewController.m
//  Weather
//
//  Created by Nghia Tran on 8/4/17.
//  Copyright © 2017 Nghia Tran. All rights reserved.
//

#import "WeatherViewController.h"
#import <WeatherCore/WeatherCore.h>

@interface WeatherViewController ()

@property (strong, nonatomic) WeatherViewModel *viewModel;

@end

@implementation WeatherViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.viewModel = [[WeatherViewModel alloc] init];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
