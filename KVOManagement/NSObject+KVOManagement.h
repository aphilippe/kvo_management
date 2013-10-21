//
//  NSObject+KVOManagement.h
//  KVOManagerTestApplication
//
//  Created by Adrien Philippe on 15/10/13.
//  Copyright (c) 2013 tkm. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "KVOManagementConstants.h"

@class KVOManager;

@interface NSObject (KVOManagement)

@property(nonatomic, readonly) KVOManager* kvoManager;

- (void)observeObject:(id)object forKeyPath:(NSString*)keyPath andBlock:(KVOManagementCallback)callback;
- (void)observeObject:(id)object forKeyPath:(NSString*)keyPath options:(NSKeyValueObservingOptions)options andBlock:(KVOManagementCallback)callback;
- (void)observeObject:(id)object forKeyPath:(NSString*)keyPath options:(NSKeyValueObservingOptions)options onQueue:(NSOperationQueue*)queue andBlock:(KVOManagementCallback)callback;

@end