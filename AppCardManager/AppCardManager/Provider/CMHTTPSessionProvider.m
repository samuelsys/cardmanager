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
static NSString *const CMRequestRegisterURL = @"http://cardmanagerserver.herokuapp.com/signup";

@implementation CMHTTPSessionProvider

+ (instancetype)sharedInstance {
    static CMHTTPSessionProvider *sharedInstance = nil;
    if (!sharedInstance){
        sharedInstance = [[CMHTTPSessionProvider alloc] init];
    }
    return sharedInstance;
}

- (void)loginWithUserName:(NSString*)userName
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

- (void)requestUserRegister:(NSString*)userName
                email:(NSString*)email
                celPhone:(NSString*)celPhone
                cardNumber:(NSString*)cardNumber
                 success:(UserSuccessProviderBlock)success
                 failure:(UserFailureProviderBlock)failure {
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    
    NSDictionary *parameters = @{@"name": userName ,
                                 @"email": email,
                                 @"phone_number": celPhone,
                                 @"card_number": cardNumber};
    
    [manager POST:CMRequestRegisterURL parameters:parameters constructingBodyWithBlock:^(id<AFMultipartFormData> formData) {
    } progress:nil success:^(NSURLSessionDataTask *operation, id responseObject) {
        success(responseObject);
    } failure:^(NSURLSessionDataTask *operation, NSError *error) {
        failure (error);
    }];
}

@end
