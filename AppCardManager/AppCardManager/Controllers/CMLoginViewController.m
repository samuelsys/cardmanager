//
//  CMLoginViewController.m
//  AppCardManager
//
//  Created by Samuel Furtado e Silva on 04/04/17.
//  Copyright © 2017 Samuel Furtado e Silva. All rights reserved.
//

#import "CMLoginViewController.h"
#import "CMValidators.h"
#import "CMAlerts.h"
#import "CMLoginView.h"

@interface CMLoginViewController ()

@property (weak, nonatomic, readonly) CMLoginView *loginView;

@end

@implementation CMLoginViewController

#pragma mark - Override

- (void) viewDidLoad {
    [super viewDidLoad];
    [self.loginView setup];
}

- (CMLoginView *)loginView {
    return (CMLoginView *) self.view;
}

#pragma mark - IBActions

- (IBAction)login:(id)sender {
    [self.loginView tryPerformLogin];
}

@end
