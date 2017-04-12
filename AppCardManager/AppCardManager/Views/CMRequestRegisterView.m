//
//  CMRequestRegisterView.m
//  AppCardManager
//
//  Created by Samuel Furtado e Silva on 09/04/17.
//  Copyright © 2017 Samuel Furtado e Silva. All rights reserved.
//

#import "CMRequestRegisterView.h"
#import "CMAdditions.h"
#import "CMAlerts.h"
#import "CMMasks.h"
#import "CMValidators.h"
#import "CMComponentSetups.h"
#import "CMGenericConstants.h"

@interface CMRequestRegisterView ()

@property (weak, nonatomic) IBOutlet UITextField *nameTextField;
@property (weak, nonatomic) IBOutlet UITextField *emailTextField;
@property (weak, nonatomic) IBOutlet UITextField *celPhoneTextField;
@property (weak, nonatomic) IBOutlet UITextField *cardNumberTextField;
@property (strong, nonatomic) UIViewController *controller;
@property (weak, nonatomic) IBOutlet UIButton *allowCheckBox;

@end

@implementation CMRequestRegisterView

#pragma mark - Public Methods

- (void)setupWithController:(UIViewController *)controller {
    self.controller = controller;
    
    self.nameTextField.delegate = self;
    self.emailTextField.delegate = self;
    self.celPhoneTextField.delegate = self;
    self.cardNumberTextField.delegate = self;
    
    UIColor *defaultPlaceholderColor = [CMAdditions cm_greyishBrownColor];
  
    [CMComponentSetups setupTextField:self.nameTextField withColor:defaultPlaceholderColor];
    [CMComponentSetups setupTextField:self.emailTextField withColor:defaultPlaceholderColor];
    [CMComponentSetups setupTextField:self.celPhoneTextField withColor:defaultPlaceholderColor];
    [CMComponentSetups setupTextField:self.cardNumberTextField withColor:defaultPlaceholderColor];
}

-(BOOL)isRegisterFormValid {
    NSString *name = self.nameTextField.text;
    NSString *email = self.emailTextField.text;
    NSString *celPhone = self.celPhoneTextField.text;
    NSString *cardNumber = self.cardNumberTextField.text;
    
    BOOL isOffline = [CMValidators isConnectionOffline];
    BOOL isSomeTextFieldEmpty = !name.length || !email.length || !celPhone.length || !cardNumber.length;
    BOOL isEmailValid = [CMValidators isEmailValid:email];
    BOOL isNameValid = [CMValidators hasMinimum3Characters:name];
    BOOL isCelPhoneValid = [CMValidators isCelPhoneValid:celPhone];
    
    if (isOffline || isSomeTextFieldEmpty || !isEmailValid || !isNameValid || !isCelPhoneValid){
        NSString *message = isOffline ? CMConnectionOffline :
                            isSomeTextFieldEmpty ? CMEmptyFields :
                            !isEmailValid ? CMInvalidFormatEmail :
                            !isNameValid ? CMNameMinimumCharacters :
                            !isCelPhoneValid ? CMCelPhoneMinimumCharacters : @"";

        [CMAlerts showMessage:message withTitle:CMWarningFeedbackTitle viewController:self.controller];
        return NO;
    }
    return YES;
}

- (void)requestSentWithSuccess {
    [CMAlerts showMessage:CMRegisterSuccess withTitle:CMWarningFeedbackTitle viewController:self.controller];
}

- (void)requestFailure {
    [CMAlerts showMessage:CMRegisterFailure withTitle:CMWarningFeedbackTitle viewController:self.controller];
}

#pragma mark - Overrides

- (NSString *)userName {
    return self.nameTextField.text;
}

- (NSString *)email {
    return self.emailTextField.text;
}

- (NSString *)celPhone {
    return self.celPhoneTextField.text;
}

- (NSString *)cardNumber { 
    return self.cardNumberTextField.text;
}

#pragma mark - Delegates

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    if(range.length + range.location > textField.text.length){
        return NO;
    }
    
    NSInteger textLimit = 0;
    
    switch (textField.tag) {
        case CMTagTextFieldRegisterName:
            textLimit = CMTextFieldLimitRegisterName;
        break;
        case CMTagTextFieldRegisterEmail:
            textLimit = CMTextFieldLimitRegisterEmail;
        break;
        case CMTagTextFieldRegisterCelPhone:
            textLimit = CMTextFieldLimitRegisterCelPhone;
            if (string.length > 0){
                textField.text = [CMMasks configurePhoneMask:textField.text];
                if (![CMValidators isNumeric:string]){
                    return NO;
                }
            }
        break;
        case CMTagTextFieldRegisterCardNumber:
            textLimit = CMTextFieldLimitRegisterCardNumber;
            if (string.length > 0 && ![CMValidators isNumeric:string]){
                return NO;
            }
        break;
    }
    
    NSUInteger newLength = textField.text.length + string.length - range.length;
    return newLength <= textLimit;
}
@end
