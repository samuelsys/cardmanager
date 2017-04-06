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

static NSString* const ACMWarningFeedbackTitle = @"Ops";
static NSString* const ACMSuccessFeedbackTitle = @"Sucesso";
static NSString* const ACMInvalidFormatEmail = @"Formato de Email Inválido";
static NSString* const ACMminimumPasswordLength = @"Senha deve ter 6 caracteres";
static NSString* const ACMEmptyEMailOrPassword = @"Email e senha devem ser preenchidos";
static NSString* const ACMLoginSuccess = @"Login Realizado com Sucesso";

@interface CMLoginView () <UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField *loginEmail;
@property (weak, nonatomic) IBOutlet UITextField *loginPassword;
@property (weak, nonatomic) IBOutlet UIButton *signinButton;
@property (weak, nonatomic) IBOutlet UIButton *requestRegisterButton;

@end

@implementation CMLoginView

#pragma mark - Public Methods

- (void) setup {
    self.loginEmail.delegate = self;
    self.loginPassword.delegate = self;
    
    [self setupTextField:self.loginEmail];
    [self setupTextField:self.loginPassword];
    
    [self setupButton:self.signinButton];
    [self setupButton:self.requestRegisterButton];
    
}

- (void) tryPerformLogin {
    if ([self validateFullLogin]){
        [[CMAlerts sharedInstance] showMessage:ACMLoginSuccess
                                     withTitle:ACMSuccessFeedbackTitle
                                viewController:self.window.rootViewController];
    }
}

#pragma mark - Private Methods

- (void) setupTextField:(UITextField*) textField{
    
    [textField setValue:[UIColor whiteColor] forKeyPath:@"_placeholderLabel.textColor"];
    
    CALayer *border = [CALayer layer];
    CGFloat borderWidth = 0.6;
    
    border.borderColor = [UIColor whiteColor].CGColor;
    
    border.frame = CGRectMake(0, textField.frame.size.height - borderWidth, textField.frame.size.width, textField.frame.size.height);
    
    border.borderWidth = borderWidth;
    
    textField.font = [CMAdditions cm_headerFont];
    
    [textField.layer addSublayer:border];
    
    textField.layer.masksToBounds = YES;
}

- (void) setupButton: (UIButton*) button {
    button.layer.borderWidth = 0;
    button.titleLabel.font = [CMAdditions cm_headerFont];
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


#pragma mark - Delegates

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
