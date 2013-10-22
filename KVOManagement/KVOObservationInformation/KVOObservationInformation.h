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

@property (nonatomic, weak)id observer;
@property (nonatomic, weak)id observee;
@property (nonatomic, readwrite)KVOManagementBlockCallback callback;

@end
