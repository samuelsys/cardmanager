//
//  CMExtract.m
//  AppCardManager
//
//  Created by Samuel Furtado e Silva on 06/04/17.
//  Copyright © 2017 Samuel Furtado e Silva. All rights reserved.
//

#import "CMExtract.h"

@implementation CMExtract

-(CMExtract*) initWithDictionary:(NSDictionary*) extractDictionary{
    
    CMExtract *extract = [CMExtract new];
    
    extract.date = [extractDictionary objectForKey:@"date"];
    extract.spent = [extractDictionary objectForKey:@"spent"];
    extract.value = [extractDictionary objectForKey:@"value"];

    return extract;
}

@end
