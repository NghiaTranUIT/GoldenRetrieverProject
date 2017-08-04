//
//  UIAlertController+Helper.h
//  Weather
//
//  Created by Nghia Tran on 8/5/17.
//  Copyright © 2017 Nghia Tran. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIAlertController (Helper)

+(void) presentAlertControllerWithMessage:(NSString *) message rootController:(UIViewController *) controller;

@end
