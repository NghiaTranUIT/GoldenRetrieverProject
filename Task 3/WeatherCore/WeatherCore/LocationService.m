//
//  LocationService.m
//  WeatherCore
//
//  Created by Nghia Tran on 8/4/17.
//  Copyright © 2017 Nghia Tran. All rights reserved.
//

#import "LocationService.h"

@interface LocationService () <CLLocationManagerDelegate>

@property (copy, nonatomic) LocationBlock locationBlock;
@property (copy, nonatomic) ErrorBlock errorBlock;

@property (strong, nonatomic) CLLocationManager *manager;

@end

@implementation LocationService

+(instancetype) shareInstance {
    static LocationService *instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[LocationService alloc] init];
    });
    return instance;
}

-(instancetype) init {
    self = [super init];

    if (self) {
        self.manager = [[CLLocationManager alloc] init];
        self.manager.delegate = self;
        self.manager.desiredAccuracy = kCLLocationAccuracyBest;
    }
    return self;
}

+(CLAuthorizationStatus) authorizationStatus {
    return [CLLocationManager authorizationStatus];
}

+(BOOL)locationServicesEnabled {
    return [CLLocationManager locationServicesEnabled];
}

-(void) fetchLocation:(LocationBlock) block errorBlock:(ErrorBlock)error {
    self.locationBlock = [block copy];
    self.errorBlock = [error copy];

    // Fetch only one request
    [self.manager requestLocation];
}

-(void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray<CLLocation *> *)locations {

    if (self.locationBlock == nil) {
        return;
    }

    // Call
    self.locationBlock(locations.lastObject);
}

-(void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error {
    if (self.errorBlock) {
        self.errorBlock(error);
    }
}

@end
