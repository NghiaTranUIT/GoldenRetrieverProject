//
//  NetworkService.m
//  WeatherCore
//
//  Created by Nghia Tran on 8/4/17.
//  Copyright © 2017 Nghia Tran. All rights reserved.
//

#import "NetworkService.h"

@interface NetworkService()

@property (strong, nonatomic) NSURLSession *session;

@end

@implementation NetworkService

-(instancetype) initWithURLSession:(NSURLSession *)session {
    self = [super init];

    if (self) {
        self.session = session;
    }

    return self;
}

-(void) executeRequest:(id<Requestable>) request {

    NSURLRequest *urlRequest = [request buildRequest];
    [self.session dataTaskWithRequest:urlRequest completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {


    }];
}

@end
