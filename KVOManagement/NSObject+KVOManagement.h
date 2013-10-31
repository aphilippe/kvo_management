//
//  NSObject+KVOManagement.h
//  KVOManagerTestApplication
//
//  Created by Adrien Philippe on 15/10/13.
//  Copyright (c) 2013 tkm. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "KVOManagementConstants.h"

@interface NSObject (KVOManagement)

- (void)observeObject:(id)object atKeypath:(NSString*)keypath andBlock:(KVOManagementBlockCallback)callback;

@end