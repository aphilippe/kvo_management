//
//  NSObject+KVOManagement.h
//  KVOManagerTestApplication
//
//  Created by Adrien Philippe on 15/10/13.
//  Copyright (c) 2013 tkm. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "KVOManagementConstants.h"
#import "KVOObservationInformation.h"

typedef void (^KVOObservationInformationBlock)(KVOObservationInformation** infos);

@class KVOToken;

@interface NSObject (KVOManagement)

- (KVOToken*)observeObject:(id)object atKeypath:(NSString*)keypath andBlock:(KVOManagementBlockCallback)callback;

// Will change observer with self if nil
- (KVOToken*)observeWithInformation:(KVOObservationInformation*)information;
- (KVOToken*)observeWithInformationBlock:(KVOObservationInformationBlock)block;

- (void)removeObservationWithToken:(KVOToken*)token;

@end