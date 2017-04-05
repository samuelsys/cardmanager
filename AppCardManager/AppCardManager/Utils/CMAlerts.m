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

+(instancetype) sharedInstance{
    
    static CMAlerts *sharedInstance = nil;
    
    if (!sharedInstance){
        sharedInstance = [[CMAlerts alloc] init];
    }
    return sharedInstance;
}

-(void)showMessage:(NSString*)message withTitle:(NSString *)title viewController:(UIViewController*) vc {
    UIAlertController *alert = [UIAlertController
                                 alertControllerWithTitle:title
                                 message:message
                                 preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *okButton = [UIAlertAction
                                actionWithTitle:ACMActionLabelOkButton
                                style:UIAlertActionStyleDefault
                                handler:nil];
    [alert addAction:okButton];

    [vc presentViewController:alert animated:YES completion:nil];
}


@end
