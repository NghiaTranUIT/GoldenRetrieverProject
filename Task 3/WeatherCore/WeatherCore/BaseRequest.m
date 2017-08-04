//
//  BaseRequest.m
//  WeatherCore
//
//  Created by Nghia Tran on 8/4/17.
//  Copyright © 2017 Nghia Tran. All rights reserved.
//

#import "BaseRequest.h"
#import <AFNetworking/AFNetworking.h>
#import "Constants.h"

@interface BaseRequest ()

@property (strong, nonatomic) id<Parammeter> param;

@end

@implementation BaseRequest

-(instancetype) initWithParam:(id<Parammeter>)param {
    self = [super init];

    if (self) {
        self.param = param;
    }

    return self;
}

-(HTTPMethod) httpMethod {
    return HTTPMethodGET;
}

-(NSString *) path {
    return @"/";
}

-(NSString *)baseURL {
    return [NSString stringWithFormat:@"%@%@", k_API_ROOT, k_API_BASE];
}

-(id)decodeObject:(id)response {
    return nil;
}

-(NSURLRequest *)buildRequest {
    NSString *fullPath = [NSString stringWithFormat:@"%@%@", self.baseURL, self.path];
    return [[AFHTTPRequestSerializer serializer] requestWithMethod:[self httpMethodString]
                                                  URLString:fullPath
                                                 parameters:[[self param] buildParam]
                                                    error:nil];
}

-(void) handleCompletion:(id) responseObject {

    // Try to decode here
    id decodeObj = [self decodeObject:responseObject];

    // Complete
    if (self.completionBlock) {
        self.completionBlock(decodeObj);
    }
}

-(void) handleError:(NSError *) error {
    if (self.errorBlock) {
        self.errorBlock(error);
    }
}

-(NSString *) httpMethodString {
    switch ([self httpMethod]) {
        case HTTPMethodGET:
            return @"GET";
        case HTTPMethodPOST:
            return @"POST";
        case HTTPMethodPUT:
            return @"PUT";
    }
}
@end
