//
//  CMExtract.h
//  AppCardManager
//
//  Created by Samuel Furtado e Silva on 06/04/17.
//  Copyright © 2017 Samuel Furtado e Silva. All rights reserved.
//

@import Foundation;

@interface CMExtract : NSObject

@property (strong, nonatomic) NSString *date;
@property (strong, nonatomic) NSString *spent;
@property (strong, nonatomic) NSString *value;

-(CMExtract*) initWithDictionary:(NSDictionary*) extractDictionary;

@end
