//
//  NetworkService.m
//  WeatherCore
//
//  Created by Nghia Tran on 8/4/17.
//  Copyright © 2017 Nghia Tran. All rights reserved.
//

#import "NetworkService.h"
#import <AFNetworking/AFNetworking.h>

static NSString *const k_Queue_Background_Name = @"com.nghiatran.queue.background";

@interface NetworkService() <NSURLSessionDelegate>

@property (strong, nonatomic) AFURLSessionManager *session;

@end

@implementation NetworkService

-(instancetype) init {
    self = [super init];

    if (self) {

        // Default URLSession
        self.session = [self defaultManager];
    }

    return self;
}
-(instancetype) initWithURLSession:(AFURLSessionManager *)session {
    self = [super init];

    if (self) {
        self.session = session;
    }

    return self;
}

#pragma mark - Default

-(AFURLSessionManager *) defaultManager {
    NSURLSessionConfiguration *configuration = [self defaultConfiguration];
    AFURLSessionManager *manager = [[AFURLSessionManager alloc] initWithSessionConfiguration:configuration];
    return manager;
}

-(NSURLSessionConfiguration *) defaultConfiguration {
    NSURLSessionConfiguration *configure = [NSURLSessionConfiguration defaultSessionConfiguration];
    configure.allowsCellularAccess = true;
    configure.networkServiceType = NSURLNetworkServiceTypeBackground;
    return configure;
}

#pragma mark - Private

-(void) executeRequest:(id<Requestable>) request {

    // Build request
    // Because we probably ship our SDK to the developer over the world.
    // Object or Struct (SWIFT) work as well
    //
    NSURLRequest *urlRequest = [request buildRequest];

    // Start to fetch
    NSURLSessionDataTask *dataTask = [self.session dataTaskWithRequest:urlRequest
                                                     completionHandler:^(NSURLResponse *response, id responseObject, NSError *error) {

        if (error) {
            // Handle Error
            [request handleError:error];
            return ;
        }

        // Success
        [request handleCompletion: responseObject];
    }];

    // Start
    [dataTask resume];
}

@end
