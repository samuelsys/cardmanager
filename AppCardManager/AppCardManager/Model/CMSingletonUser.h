//
//  CMSingletonUser.h
//  AppCardManager
//
//  Created by Samuel Furtado e Silva on 07/04/17.
//  Copyright © 2017 Samuel Furtado e Silva. All rights reserved.
//

@import Foundation;
#import "CMUser.h"

@interface CMSingletonUser : NSObject

@property (nonatomic, strong) CMUser *loggedUser;

/**
 *  a shared instance for CMSingletonUser
 *
 *  @return <#return value description#>
 */
+(instancetype) sharedInstance;

@end
