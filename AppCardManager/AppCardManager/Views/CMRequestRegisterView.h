//
//  CMRequestRegisterView.h
//  AppCardManager
//
//  Created by Samuel Furtado e Silva on 09/04/17.
//  Copyright © 2017 Samuel Furtado e Silva. All rights reserved.
//

@import UIKit;
#import "CardIO.h"

@interface CMRequestRegisterView : UIView <UITextFieldDelegate>

@property (strong, nonatomic, readonly) NSString *userName;
@property (strong, nonatomic, readonly) NSString *email;
@property (strong, nonatomic, readonly) NSString *celPhone;
@property (strong, nonatomic, readonly) NSString *cardNumber;

typedef NS_ENUM(NSInteger, CMTagTextFieldRegister){
    CMTagTextFieldRegisterName = 0,
    CMTagTextFieldRegisterEmail,
    CMTagTextFieldRegisterCelPhone,
    CMTagTextFieldRegisterCardNumber
};

typedef NS_ENUM(NSInteger, CMTextFieldLimitRegister){
    CMTextFieldLimitRegisterName = 100,
    CMTextFieldLimitRegisterEmail = 100,
    CMTextFieldLimitRegisterCelPhone = 15,
    CMTextFieldLimitRegisterCardNumber = 20
};

/**
 *  setup view with a controller
 *
 *  @param controller
 */
- (void)setupWithController:(UIViewController *)controller;

/**
 *  Verify if the Request Register Form is valid
 *
 *  @return true if all fields valids
 */
- (BOOL)isRegisterFormValid;

/**
 *  
 */
- (void)requestSentWithSuccess;

/**
 *
 */
- (void)requestFailure;

@end
