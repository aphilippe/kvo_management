//
//  NSObject+KVOManagement.h
//  KVOManagerTestApplication
//
//  Created by Adrien Philippe on 15/10/13.
//  Copyright (c) 2013 tkm. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "KVOManagementConstants.h"

@class KVOToken;

@interface NSObject (KVOManagement)

- (KVOToken*)observeObject:(id)object atKeypath:(NSString*)keypath andBlock:(KVOManagementBlockCallback)callback;
- (void)removeObservationWithToken:(KVOToken*)token;

@end