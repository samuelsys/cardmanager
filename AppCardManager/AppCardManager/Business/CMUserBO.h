//
//  CMUserBO.h
//  AppCardManager
//
//  Created by Samuel Furtado e Silva on 06/04/17.
//  Copyright © 2017 Samuel Furtado e Silva. All rights reserved.
//

@import Foundation;
#import "CMUser.h"

typedef void (^UserSuccessBlock)(CMUser *);
typedef void (^UserErrorBlock)(NSError *, NSString *);
typedef void (^UserRegisterSuccess)(NSString *);

@interface CMUserBO : NSObject

/**
 *  Method will call Provider login
 *
 *  @param user
 *  @param password
 *  @param success
 *  @param failure
 */

+ (void) newUserRequestRegister:(NSString *)userName
                          email:(NSString *)email
                       celphone:(NSString *)celphone
                     cardNumber:(NSString *)cardNumber
                        success:(UserRegisterSuccess)success
                        failure:(UserErrorBlock)failure;


/**
 *  Will Call Provider Request Register
 *
 *  @param user
 *  @param password
 *  @param success
 *  @param failure  
 */
+ (void)loginWithUserName:(NSString *)user
                 password:(NSString *)password
                  success:(UserSuccessBlock)success
                  failure:(UserErrorBlock)failure;

@end
