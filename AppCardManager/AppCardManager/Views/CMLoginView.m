//
//  CMLoginView.m
//  AppCardManager
//
//  Created by Samuel Furtado e Silva on 05/04/17.
//  Copyright © 2017 Samuel Furtado e Silva. All rights reserved.
//

#import "CMLoginView.h"
#import "CMLoginViewController.h"
#import "CMAlerts.h"
#import "CMValidators.h"
#import "CMAdditions.h"
#import "CMComponentSetups.h"
#import "CMGenericConstants.h"

@interface CMLoginView () <UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField *loginEmail;
@property (weak, nonatomic) IBOutlet UITextField *loginPassword;
@property (weak, nonatomic) IBOutlet UIButton *signinButton;
@property (weak, nonatomic) IBOutlet UIButton *requestRegisterButton;

@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *spinner;

@property (strong, nonatomic) UIViewController *controller;

@end

@implementation CMLoginView

#pragma mark - Override properties

- (void)startLoading{
    [self.spinner startAnimating];
    [self showLoadingIndicator];
}

- (void)stopLoading{
    [self.spinner stopAnimating];
    [self hideLoadingIndicator];
}

- (NSString *)email {
    return self.loginEmail.text;
}

- (NSString *)password {
    return self.loginPassword.text;
}

#pragma mark - Public Methods

- (void)setupWithController:(UIViewController *)controller {
    self.controller = controller;
    self.loginEmail.delegate = self;
    self.loginPassword.delegate = self;
    
    [CMComponentSetups setupTextField:self.loginEmail withColor:[CMAdditions cm_whiteTwoColor]];
    [CMComponentSetups setupTextField:self.loginPassword withColor:[CMAdditions cm_whiteTwoColor]];
    
    [self setupButton:self.signinButton];
    [self setupButton:self.requestRegisterButton];
    
}

#pragma mark - Private Methods
     
-(void)showLoadingIndicator{
    self.spinner.alpha = 1.0;
}

-(void)hideLoadingIndicator{
    self.spinner.alpha = 0.0;
}

- (void)setupButton:(UIButton *)button {
    button.layer.borderWidth = 0;
    button.titleLabel.font = [CMAdditions cm_headerFont];
}

- (void)loginFailureMessage:(NSString *)message {
    [CMAlerts showMessage:message
                withTitle:CMWarningFeedbackTitle
           viewController:self.controller];
}

-(BOOL)validateFullLogin {
    NSString *email = self.loginEmail.text;
    NSString *password = self.loginPassword.text;
    
    BOOL isOffline = [CMValidators isConnectionOffline];
    BOOL isSomeTextFieldEmpty = !email.length || !password.length;
    BOOL isEmailValid = [CMValidators isEmailValid:email];
    BOOL isPasswordValid = password.length == CMTextFieldLimitPassword;
    
    if (isOffline || isSomeTextFieldEmpty || !isEmailValid || !isPasswordValid) {
        [CMAlerts showMessage:isOffline ? CMConnectionOffline :
                              isSomeTextFieldEmpty ? CMEmptyFields :
                              isEmailValid ? CMminimumPasswordLength : CMInvalidFormatEmail
                    withTitle:CMWarningFeedbackTitle
               viewController:self.controller];
        return NO;
    }
    return YES;
}

#pragma mark - Delegates

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    if(range.length + range.location > textField.text.length){
        return NO;
    }
    
    NSInteger textLimit = textField == self.loginEmail ? CMTextFieldLimitEmail : CMTextFieldLimitPassword;
    
    NSUInteger newLength = textField.text.length + string.length - range.length;
    return newLength <= textLimit;
}

@end
