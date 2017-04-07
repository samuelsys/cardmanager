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

static NSString *const CMGenericErrorMessage = @"Erro inesperado";

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
                        
                        NSString *result = [responseObject objectForKey:@"result"];
                        
                        if ([result isEqualToString:@"error"]){
                            NSString *message = [responseObject objectForKey:@"message"];
                            NSError* error = nil;
                            return failure(error, message);
                        }
                        
                        CMUser *user = [[CMUser alloc] initWIthLoginResponse:responseObject];
                        success(user);
                        
                    } failure:^(NSError *error) {
                        failure(error, CMGenericErrorMessage);
                    }
     ];
}

@end
