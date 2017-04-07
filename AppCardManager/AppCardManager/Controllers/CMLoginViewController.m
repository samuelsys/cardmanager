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
#import "CMLoginManager.h"
#import "CMUser.h"

@interface CMLoginViewController ()

@property (weak, nonatomic, readonly) CMLoginView *loginView;
@property (strong, nonatomic) CMLoginManager *manager;

@end

@implementation CMLoginViewController

#pragma mark - Override

-(CMLoginManager *)manager {
    
    if (!_manager){
        _manager = [CMLoginManager new];
    }
    return _manager;
    
}

- (void) viewDidLoad{
    [super viewDidLoad];
    [self.loginView setupWithController:self];
}

- (CMLoginView *)loginView{
    return (CMLoginView *) self.view;
}

#pragma mark - IBActions

- (IBAction)login:(id)sender{
    
    if ([self.loginView validateFullLogin]){
        [self.loginView startLoading];
        [self.manager loginWithUserName:self.loginView.email
                               password:self.loginView.password
                    withCompletionBlock:^(CMUser *user, BOOL success) {
                         [self.loginView stopLoading];
        }];
    }
};

@end
