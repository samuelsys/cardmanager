//
//  CMUserBO.h
//  AppCardManager
//
//  Created by Samuel Furtado e Silva on 06/04/17.
//  Copyright © 2017 Samuel Furtado e Silva. All rights reserved.
//

@import Foundation;
#import "CMUser.h"

typedef void (^UserSuccessBlock)(CMUser*);
typedef void (^UserErrorBlock)(NSError*);

@interface CMUserBO : NSObject

/**
 *  Method will call Provider login
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
