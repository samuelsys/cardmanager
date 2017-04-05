//
//  LoginViewController.m
//  AppCardManager
//
//  Created by Samuel Furtado e Silva on 04/04/17.
//  Copyright © 2017 Samuel Furtado e Silva. All rights reserved.
//

#import "LoginViewController.h"
#import "Validators.h"
#import "Alerts.h"

static NSInteger const ACMloginEmailTextLimit = 100;
static NSInteger const ACMloginPasswordTextLimit = 6;

static NSString* const ACMWarningFeedbackTitle = @"Ops";
static NSString* const ACMSuccessFeedbackTitle = @"Sucesso";
static NSString* const ACMInvalidFormatEmail = @"Formato de Email Inválido";
static NSString* const ACMminimumPasswordLength = @"Senha deve ter 6 caracteres";
static NSString* const ACMEmptyEMailOrPassword = @"Email e senha devem ser preenchidos";
static NSString* const ACMLoginSuccess = @"Login Realizado com Sucesso";

@interface LoginViewController () <UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField *loginEmail;
@property (weak, nonatomic) IBOutlet UITextField *loginPassword;

@end

@implementation LoginViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    self.loginEmail.delegate = self;
    self.loginPassword.delegate = self;
    
}

- (IBAction)login:(id)sender {
    if ([self validateFullLogin]){
        [[Alerts sharedInstance] showMessage:ACMLoginSuccess withTitle:ACMSuccessFeedbackTitle viewController:self];
    }
}

-(BOOL) validateFullLogin {
    
    BOOL canPerformLogin = YES;
    
    if ([self.loginEmail.text length] > 0 && [self.loginPassword.text length] > 0){
        
        if (![[Validators sharedInstance] isEmailValid:self.loginEmail.text]){
            [[Alerts sharedInstance] showMessage:ACMInvalidFormatEmail withTitle:ACMWarningFeedbackTitle viewController:self];
            return !canPerformLogin;
        }
        if (!([self.loginPassword.text length] == 6)){
            [[Alerts sharedInstance] showMessage:ACMminimumPasswordLength withTitle:ACMWarningFeedbackTitle viewController:self];
            return !canPerformLogin;
        }
    }else{
        [[Alerts sharedInstance] showMessage:ACMEmptyEMailOrPassword withTitle:ACMWarningFeedbackTitle viewController:self];
        return !canPerformLogin;
    }
    
    return canPerformLogin;
    
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

@end
