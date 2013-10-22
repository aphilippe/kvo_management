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
@interface KVOManager : NSObject
{
    id _object;
    NSMutableArray* _observations;
}

// Lifre cycle
- (id)initWithObject:(id)object;

// Public methods
- (void)addObservation:(KVOObservation*)observation;

@end
