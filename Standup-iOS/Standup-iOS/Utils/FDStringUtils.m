//
//  FDStringUtils.m
//  Standup-iOS
//
//  Created by Sergii Nezdolii on 2014-06-13.
//  Copyright (c) 2014 FrostDigital. All rights reserved.
//

#import "FDStringUtils.h"

@implementation FDStringUtils

+(NSString*) extractDeviceTokenFrom:(NSData*)data {
    
    if(data != nil) {
        return [[[[data description]
                  stringByReplacingOccurrencesOfString: @"<" withString: @""]
                 stringByReplacingOccurrencesOfString: @">" withString: @""]
                stringByReplacingOccurrencesOfString: @" " withString: @""];
    }
    
    return nil;
}

@end
