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

static NSString* const ACMWarningFeedbackTitle = @"Ops";
static NSString* const ACMSuccessFeedbackTitle = @"Sucesso";
static NSString* const ACMInvalidFormatEmail = @"Formato de Email Inválido";
static NSString* const ACMminimumPasswordLength = @"Senha deve ter 6 caracteres";
static NSString* const ACMEmptyEMailOrPassword = @"Email e senha devem ser preenchidos";
static NSString* const ACMLoginSuccess = @"Login Realizado com Sucesso";

@interface CMLoginView () <UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField *loginEmail;
@property (weak, nonatomic) IBOutlet UITextField *loginPassword;

@end

@implementation CMLoginView

- (void) setup {
    self.loginEmail.delegate = self;
    self.loginPassword.delegate = self;
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{
    
    NSInteger textLimit = 0;
    
    if(range.length + range.location > textField.text.length){
        return NO;
    }
    
    if (textField == self.loginEmail){
        textLimit = ACMloginEmailTextLimit;
    }else{
        if (textField == self.loginPassword){
            textLimit = ACMloginPasswordTextLimit;
        }
    }
    
    NSUInteger newLength = [textField.text length] + [string length] - range.length;
    return newLength <= textLimit;
    
}

- (void) tryPerformLogin {
    if ([self validateFullLogin]){
        [[CMAlerts sharedInstance] showMessage:ACMLoginSuccess
                                   withTitle:ACMSuccessFeedbackTitle
                                   viewController:self.window.rootViewController];
    }
}

-(BOOL) validateFullLogin {
    
    BOOL canPerformLogin = YES;
    NSString *email = self.loginEmail.text;
    NSString *password = self.loginPassword.text;
    
    if ([email length] > 0 && [password length] > 0){
        
        if (![[CMValidators sharedInstance] isEmailValid:email]){
            [[CMAlerts sharedInstance] showMessage:ACMInvalidFormatEmail
                                       withTitle:ACMWarningFeedbackTitle
                                       viewController:self.window.rootViewController];
            return !canPerformLogin;
        }
        if (!([password length] == ACMloginPasswordTextLimit)){
            [[CMAlerts sharedInstance] showMessage:ACMminimumPasswordLength
                                       withTitle:ACMWarningFeedbackTitle
                                       viewController:self.window.rootViewController];
            return !canPerformLogin;
        }
    }else{
        [[CMAlerts sharedInstance] showMessage:ACMEmptyEMailOrPassword
                                   withTitle:ACMWarningFeedbackTitle
                                   viewController:self.window.rootViewController];
        return !canPerformLogin;
    }
    
    return canPerformLogin;
    
}

@end
