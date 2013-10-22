//
//  KVOObservation.h
//  KVOManagerTestApplication
//
//  Created by Adrien Philippe on 16/10/13.
//  Copyright (c) 2013 tkm. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "KVOManagementConstants.h"

@class KVOObservationInformation;

@interface KVOObservation : NSObject
{
    KVOObservationInformation* _information;
}

@property(nonatomic, readonly) KVOObservationInformation* information;

- (id)initWithInformation:(KVOObservationInformation*)information;

@end
