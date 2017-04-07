//
//  CMLoginManager.h
//  AppCardManager
//
//  Created by Samuel Furtado e Silva on 06/04/17.
//  Copyright © 2017 Samuel Furtado e Silva. All rights reserved.
//

@import Foundation;
#import "CMUser.h"
#import "CMUserBO.h"

typedef void(^UserBlock) (CMUser* , BOOL);

@interface CMLoginManager : NSObject

/**
 *  Method will call Business Login
 *
 *  @param user
 *  @param password
 *  @param completionBlock
 */

- (void) loginWithUserName:(NSString *)user
                  password:(NSString *)password
       withCompletionBlock:(UserBlock)completionBlock;

@end
