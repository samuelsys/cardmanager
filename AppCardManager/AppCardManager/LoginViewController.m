//
//  LoginViewController.m
//  AppCardManager
//
//  Created by Samuel Furtado e Silva on 04/04/17.
//  Copyright © 2017 Samuel Furtado e Silva. All rights reserved.
//

#import "LoginViewController.h"

static NSInteger const ACMloginEmailTextLimit = 100;
static NSInteger const ACMloginPasswordTextLimit = 6;

@interface LoginViewController () <UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField *loginEmail;
@property (weak, nonatomic) IBOutlet UITextField *loginPassword;

@end

@implementation LoginViewController


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

- (void)viewDidLoad {
    [super viewDidLoad];
    self.loginEmail.delegate = self;
    self.loginPassword.delegate = self;
}
@end
