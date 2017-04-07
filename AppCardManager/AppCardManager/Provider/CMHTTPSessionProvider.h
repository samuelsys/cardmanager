//
//  CMHTTPSessionProvider.h
//  AppCardManager
//
//  Created by Samuel Furtado e Silva on 06/04/17.
//  Copyright © 2017 Samuel Furtado e Silva. All rights reserved.
//

@import Foundation;

typedef void (^UserSuccessProviderBlock) (id);
typedef void (^UserFailureProviderBlock) (NSError *);

@interface CMHTTPSessionProvider : NSObject

+(instancetype) sharedInstance;

/**
 *  Http Post Call in LoginService
 *
 *  @param userName
 *  @param password
 *  @param success
 *  @param failure
 */

-(void) loginWithUserName:(NSString*)userName
                 password:(NSString*)password
                  success:(UserSuccessProviderBlock)success
                  failure:(UserFailureProviderBlock)failure;
@end
