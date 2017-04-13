//
//  CMSchedulePaymentViewController.m
//  AppCardManager
//
//  Created by Samuel Furtado e Silva on 13/04/17.
//  Copyright © 2017 Samuel Furtado e Silva. All rights reserved.
//

#import "CMSchedulePaymentViewController.h"
#import "SWRevealViewController.h"

@interface CMSchedulePaymentViewController ()

@end

@implementation CMSchedulePaymentViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    SWRevealViewController *revealViewController = self.revealViewController;
    if ( revealViewController ){
        [self.barButton setTarget: self.revealViewController];
        [self.barButton setAction: @selector( revealToggle: )];
        self.revealViewController.rearViewRevealWidth = self.view.frame.size.width-50;
        [self.view addGestureRecognizer:self.revealViewController.panGestureRecognizer];
    }
}

@end
