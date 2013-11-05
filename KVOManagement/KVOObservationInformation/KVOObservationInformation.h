//
//  KVOObservationInformation.h
//  KVOManagerTestApplication
//
//  Created by Adrien Philippe on 22/10/13.
//  Copyright (c) 2013 tkm. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "KVOManagementConstants.h"

@interface KVOObservationInformation : NSObject
{
    KVOManagementBlockCallback _callback;
    __unsafe_unretained id _observee;
}

@property (nonatomic, weak)id observer;
@property (nonatomic, unsafe_unretained)id observee;
@property (nonatomic, strong)KVOManagementBlockCallback callback;
@property (nonatomic, copy)NSString* keypath;

@end
