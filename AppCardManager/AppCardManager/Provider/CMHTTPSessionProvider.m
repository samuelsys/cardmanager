//
//  CMHTTPSessionProvider.m
//  AppCardManager
//
//  Created by Samuel Furtado e Silva on 06/04/17.
//  Copyright © 2017 Samuel Furtado e Silva. All rights reserved.
//

#import "CMHTTPSessionProvider.h"
#import <AFNetworking/AFHTTPSessionManager.h>

static NSString *const CMLoginServiceUrl = @"http://cardmanagerserver.herokuapp.com/login";

@implementation CMHTTPSessionProvider

+(instancetype)sharedInstance {
    
    static CMHTTPSessionProvider *sharedInstance = nil;
    
    if (!sharedInstance){
        sharedInstance = [[CMHTTPSessionProvider alloc] init];
    }
    
    return sharedInstance;
    
}

-(void)loginWithUserName:(NSString*)userName
                 password:(NSString*)password
                  success:(UserSuccessProviderBlock)success
                  failure:(UserFailureProviderBlock)failure {
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];

    NSDictionary *parameters = @{@"email": userName ,
                                 @"password": password};
    
    [manager POST:CMLoginServiceUrl parameters:parameters constructingBodyWithBlock:^(id<AFMultipartFormData> formData) {
    } progress:nil success:^(NSURLSessionDataTask *operation, id responseObject) {
        success(responseObject);
    } failure:^(NSURLSessionDataTask *operation, NSError *error) {
        failure (error);
    }];
}

@end
