//
//  CMUserBO.m
//  AppCardManager
//
//  Created by Samuel Furtado e Silva on 06/04/17.
//  Copyright © 2017 Samuel Furtado e Silva. All rights reserved.
//

#import "CMUserBO.h"
#import "CMUser.h"
#import "CMHTTPSessionProvider.h"

@interface CMUserBO ()
@end

@implementation CMUserBO

+ (void)loginWithUserName:(NSString *)user
                    password:(NSString *)password
                    success:(UserSuccessBlock)success
                    failure:(UserErrorBlock)failure {
    
    CMHTTPSessionProvider *sessionManager = [CMHTTPSessionProvider sharedInstance];
    
    [sessionManager loginWithUserName:user
                    password:password
                    success:^(id responseObject) {
                        CMUser *user = [[CMUser alloc] initWIthLoginResponse:responseObject];
                        success(user);
                        
                    } failure:^(NSError *error) {
                        failure(error);
                    }
     ];
}

@end
