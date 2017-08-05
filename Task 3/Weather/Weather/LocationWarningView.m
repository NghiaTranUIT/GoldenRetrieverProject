//
//  LocationWarningView.m
//  Weather
//
//  Created by Nghia Tran on 8/4/17.
//  Copyright © 2017 Nghia Tran. All rights reserved.
//

#import "LocationWarningView.h"
#import "NSView+Constraint.h"

static CGFloat Animation_Duration = 0.3;

@interface LocationWarningView()

@property (strong, nonatomic) NSNumber *isShowing;

@end

@implementation LocationWarningView

-(void)awakeFromNib {
    [super awakeFromNib];

    self.translatesAutoresizingMaskIntoConstraints = NO;
    self.isShowing = @NO;
}

-(IBAction) openSetting {
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:UIApplicationOpenSettingsURLString] options:@{} completionHandler:nil];
}

-(void) fadeInWarning:(UIView *) parentView {

    if (self.isShowing.boolValue == YES) {
        return;
    }

    self.isShowing = @YES;
    [parentView addSubview:self];
    [self edgeToParentView:parentView];

    // Animate
    [UIView animateWithDuration:Animation_Duration delay:0 options:UIViewAnimationOptionCurveEaseIn animations:^{

    } completion:^(BOOL finished) {

    }];
}

-(void) fadeOut {

    if (self.isShowing.boolValue == NO) {
        return;
    }

    self.isShowing = @YES;

    // Animate
    [UIView animateWithDuration:Animation_Duration delay:0 options:UIViewAnimationOptionCurveEaseIn animations:^{
        self.alpha = 0;
    } completion:^(BOOL finished) {
        [self removeFromSuperview];
    }];
}

@end
