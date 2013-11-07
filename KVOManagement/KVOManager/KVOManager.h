//
//  KVOManager.h
//  KVOManagerTestApplication
//
//  Created by Adrien Philippe on 16/10/13.
//  Copyright (c) 2013 tkm. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "KVOManagementConstants.h"

@class KVOObservation;
@class KVOToken;

@interface KVOManager : NSObject
{
    __weak id _object;
    NSMutableDictionary* _observations;
}

// Lifre cycle
- (id)initWithObject:(id)object;

// Public methods
- (KVOToken*)addObservation:(KVOObservation*)observation;
- (void)removeObservationWithToken:(KVOToken*)token;

@end
