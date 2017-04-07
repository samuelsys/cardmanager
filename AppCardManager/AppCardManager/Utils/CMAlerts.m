//
//  CMAlerts.m
//  AppCardManager
//
//  Created by Samuel Furtado e Silva on 04/04/17.
//  Copyright © 2017 Samuel Furtado e Silva. All rights reserved.
//

#import "CMAlerts.h"

static NSString* const ACMActionLabelOkButton = @"Ok";

@implementation CMAlerts

+ (void)showMessage:(NSString*)message withTitle:(NSString *)title viewController:(UIViewController*) viewController {
    UIAlertController *alert = [UIAlertController
                                 alertControllerWithTitle:title
                                 message:message
                                 preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *okButton = [UIAlertAction
                                actionWithTitle:ACMActionLabelOkButton
                                style:UIAlertActionStyleDefault
                                handler:nil];
    [alert addAction:okButton];

    [viewController presentViewController:alert animated:YES completion:nil];
}


@end
