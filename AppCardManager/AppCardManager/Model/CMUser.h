//
//  CMUser.h
//  AppCardManager
//
//  Created by Samuel Furtado e Silva on 06/04/17.
//  Copyright © 2017 Samuel Furtado e Silva. All rights reserved.
//

@import Foundation;

@interface CMUser : NSObject

@property (strong, nonatomic) NSString *name;
@property (strong, nonatomic) NSString *imageProfile;
@property (strong, nonatomic) NSMutableArray *cardMutableArray;

-(CMUser*) initWIthLoginResponse:(id)loginResponse;

@end
