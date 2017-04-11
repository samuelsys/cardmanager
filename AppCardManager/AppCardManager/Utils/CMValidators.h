//
//  CMValidators.h
//  AppCardManager
//
//  Created by Samuel Furtado e Silva on 04/04/17.
//  Copyright © 2017 Samuel Furtado e Silva. All rights reserved.
//

@import Foundation;

@interface CMValidators : NSObject

/**
 *  Verify if an email is valid
 *
 *  @param email
 *
 *  @return a BOOL if email is valid
 */
+ (BOOL)isEmailValid:(NSString *)email;

/**
 *  Verify if there is connection with network
 *
 *  @return YES if has connection
 */
+ (BOOL)isConnectionOffline;

/**
 *  Verify if a String has the first character numeric
 *
 *  @param newCharacter Text to be tested
 *
 *  @return <#return value description#>
 */

+ (BOOL)isNumeric:(NSString *)newCharacter;

/**
 *  Verify if there are 3 characters in a value
 *
 *  @param text the value to be verified
 *
 *  @return YES if > 3 characters
 */

+ (BOOL)hasMinimum3Characters:(NSString *)text;

/**
 *  Verify if a celphone has 11 characters
 *
 *  @param celPhone
 *
 *  @return YES if field = 11 characters
 */
+ (BOOL)isCelPhoneValid:(NSString *)celPhone;

@end
