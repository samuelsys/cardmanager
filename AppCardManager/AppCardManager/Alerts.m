//
//  Alerts.m
//  AppCardManager
//
//  Created by Samuel Furtado e Silva on 04/04/17.
//  Copyright © 2017 Samuel Furtado e Silva. All rights reserved.
//

#import "Alerts.h"

static NSString* const ACMActionLabelOkButton = @"Ok";

@implementation Alerts

+(instancetype) sharedInstance{
    
    static Alerts *sharedInstance = nil;
    
    if (!sharedInstance){
        sharedInstance = [[Alerts alloc] init];
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
