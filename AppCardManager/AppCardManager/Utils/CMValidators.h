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

@end
