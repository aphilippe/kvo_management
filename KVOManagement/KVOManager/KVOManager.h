//
//  KVOManager.h
//  KVOManagerTestApplication
//
//  Created by Adrien Philippe on 16/10/13.
//  Copyright (c) 2013 tkm. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "KVOManagementConstants.h"

@interface KVOManager : NSObject
{
    id _object;
    NSMutableArray* _observations;
}

// Lifre cycle
- (id)initWithObject:(id)object;

// Public methods
- (void)addObserver:(id)observer forKeyPath:(NSString*)keypath andCallbackBlock:(KVOManagementBlockCallback)block;

@end
