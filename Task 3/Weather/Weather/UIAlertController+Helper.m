//
//  UIAlertController+Helper.m
//  Weather
//
//  Created by Nghia Tran on 8/5/17.
//  Copyright © 2017 Nghia Tran. All rights reserved.
//

#import "UIAlertController+Helper.h"

@implementation UIAlertController (Helper)

+(void) presentAlertControllerWithMessage:(NSString *) message rootController:(UIViewController *) controller {
    UIAlertController * alert = [UIAlertController
                                 alertControllerWithTitle:@"Ops :("
                                 message:message
                                 preferredStyle:UIAlertControllerStyleAlert];

    UIAlertAction* okBtn = [UIAlertAction
                               actionWithTitle:@"OK!"
                               style:UIAlertActionStyleDestructive
                               handler:nil];
    [alert addAction:okBtn];
    [controller presentViewController:alert animated:YES completion:nil];
}

@end
