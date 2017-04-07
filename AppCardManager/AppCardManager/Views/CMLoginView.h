//
//  CMLoginView.h
//  AppCardManager
//
//  Created by Samuel Furtado e Silva on 05/04/17.
//  Copyright © 2017 Samuel Furtado e Silva. All rights reserved.
//

@import UIKit;

@interface CMLoginView : UIView

@property (strong, nonatomic, readonly) NSString *email;
@property (strong, nonatomic, readonly) NSString *password;


typedef NS_ENUM(NSInteger, CMTextFieldLimit){
    CMTextFieldLimitPassword = 6,
    CMTextFieldLimitEmail = 100
};

/**
 *  method to start loading animation
 */

- (void)startLoading;

/**
 * method to stop loading animation
 */

- (void)stopLoading;

/**
 *  setup the delegates in view
 */

- (void)setupWithController:(UIViewController *)controller;

/**
 *  try perform login and show alerts if fields not valid
 */

- (BOOL)validateFullLogin;

/**
 *  method to show a failure message when try perform login
 */
- (void)loginFailureMessage:(NSString *)message;

@end
