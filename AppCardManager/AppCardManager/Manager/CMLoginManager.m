//
//  CMLoginManager.m
//  AppCardManager
//
//  Created by Samuel Furtado e Silva on 06/04/17.
//  Copyright © 2017 Samuel Furtado e Silva. All rights reserved.
//

#import "CMLoginManager.h"

static NSString *const CMLoginWithSuccessMessage = @"Sucesso ao realizar login";

@interface  CMLoginManager ()

@property (strong, nonatomic) NSOperationQueue *mainQueue;
@end

@implementation CMLoginManager

-(NSOperationQueue *)mainQueue {
    if (!_mainQueue){
        _mainQueue = [NSOperationQueue new];
    }
    return _mainQueue;
}

- (void) loginWithUserName:(NSString *)user
                  password:(NSString *)password
       withCompletionBlock:(UserBlock)completionBlock{
    [self.mainQueue addOperationWithBlock:^{
        [CMUserBO loginWithUserName:user password:password success:^(id user) {
            completionBlock(user, YES, CMLoginWithSuccessMessage);
        } failure:^(NSError *error, NSString *message) {
            completionBlock(nil, NO, message);
        }];
    }];
}



@end
