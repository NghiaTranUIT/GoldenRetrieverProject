//
//  NetworkService.m
//  WeatherCore
//
//  Created by Nghia Tran on 8/4/17.
//  Copyright © 2017 Nghia Tran. All rights reserved.
//

#import "NetworkService.h"

static NSString *const k_Queue_Background_Name = @"com.nghiatran.queue.background";

@interface NetworkService() <NSURLSessionDelegate>

@property (strong, nonatomic) NSURLSession *session;

@end

@implementation NetworkService

-(instancetype) init {
    self = [super init];

    if (self) {

        // Default URLSession
        self.session = [self defaultURLSession];
    }

    return self;
}
-(instancetype) initWithURLSession:(NSURLSession *)session {
    self = [super init];

    if (self) {
        self.session = session;
    }

    return self;
}

-(NSURLSession *) defaultURLSession {
    NSOperationQueue *defaultBackgroundQueue = [self backgroundQueue];
    NSURLSessionConfiguration *defaultConfiguration = [self defaultConfiguration];
    NSURLSession *session = [NSURLSession sessionWithConfiguration:defaultConfiguration delegate:self delegateQueue:defaultBackgroundQueue];
    return session;
}

-(NSURLSessionConfiguration *) defaultConfiguration {
    NSURLSessionConfiguration *configure = [NSURLSessionConfiguration defaultSessionConfiguration];
    configure.allowsCellularAccess = true;
    configure.networkServiceType = NSURLNetworkServiceTypeBackground;
    return configure;
}

-(NSOperationQueue *) backgroundQueue {
    NSOperationQueue *queue = [[NSOperationQueue alloc] init];
    queue.name = k_Queue_Background_Name;
    queue.qualityOfService = NSQualityOfServiceBackground;
    queue.maxConcurrentOperationCount = 25;
    return queue;
}


-(void) executeRequest:(id<Requestable>) request {

    NSURLRequest *urlRequest = [request buildRequest];
    [self.session dataTaskWithRequest:urlRequest completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {

        NSLog(@"%@", data);

    }];
}

@end
