//
//  CMCardManager.m
//  AppCardManager
//
//  Created by Samuel Furtado e Silva on 12/04/17.
//  Copyright © 2017 Samuel Furtado e Silva. All rights reserved.
//

#import "CMCardManager.h"
#import "CMCard.h"
#import "CMSingletonUser.h"
#import "CMCardBO.h"

@interface  CMCardManager ()

@property (strong, nonatomic) NSOperationQueue *mainQueue;

@end

@implementation CMCardManager

-(NSOperationQueue *)mainQueue {
    if (!_mainQueue){
        _mainQueue = [NSOperationQueue new];
    }
    return _mainQueue;
}

- (void)defineCardToShow:(CardBlockManager)completion {
    
    [self.mainQueue addOperationWithBlock:^{
        [CMCardBO defineCardToShow:^(CMCard *card) {
            completion(card);
        }];
    }];
}


@end
