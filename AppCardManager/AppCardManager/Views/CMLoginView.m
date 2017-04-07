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
#import "Reachability.h"

static NSString *const CMConnectionOffline = @"Sem conexão com a internet";
static NSString *const CMWarningFeedbackTitle = @"Ops";
static NSString *const CMSuccessFeedbackTitle = @"Sucesso";
static NSString *const CMInvalidFormatEmail = @"Formato de Email Inválido";
static NSString *const CMminimumPasswordLength = @"Senha deve ter 6 caracteres";
static NSString *const CMEmptyEMailOrPassword = @"Email e senha devem ser preenchidos";
static NSString *const CMLoginSuccess = @"Login Realizado com Sucesso";

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
    
    [self setupTextField:self.loginEmail];
    [self setupTextField:self.loginPassword];
    
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
     
- (void)setupTextField:(UITextField *)textField{
    
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

- (void)setupButton:(UIButton *)button {
    button.layer.borderWidth = 0;
    button.titleLabel.font = [CMAdditions cm_headerFont];
}

-(BOOL)validateFullLogin {
    NSString *email = self.loginEmail.text;
    NSString *password = self.loginPassword.text;
    
    BOOL isOffline = [self isConnectionOffline];
    BOOL isSomeTextFieldEmpty = !email.length || !password.length;
    BOOL isEmailValid = [CMValidators isEmailValid:email];
    BOOL isPasswordValid = password.length == CMTextFieldLimitPassword;
    
    if (isOffline || isSomeTextFieldEmpty || !isEmailValid || !isPasswordValid) {
        [CMAlerts showMessage:isOffline ? CMConnectionOffline :
                              isSomeTextFieldEmpty ? CMEmptyEMailOrPassword :
                              isEmailValid ? CMminimumPasswordLength : CMInvalidFormatEmail
                    withTitle:CMWarningFeedbackTitle
               viewController:self.controller];
        return NO;
    }
    return YES;
}

- (BOOL)isConnectionOffline {
    return [[Reachability reachabilityForInternetConnection]currentReachabilityStatus]==NotReachable;
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
