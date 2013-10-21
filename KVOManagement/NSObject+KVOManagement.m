//
//  NSObject+KVOManagement.m
//  KVOManagerTestApplication
//
//  Created by Adrien Philippe on 15/10/13.
//  Copyright (c) 2013 tkm. All rights reserved.
//

#import "NSObject+KVOManagement.h"
#import <objc/runtime.h>
#import "KVOManager.h"

static const NSString* KVOManagementContext = @"KVOManagementContext";

static const NSString* KVOManagementManagerKey = @"com.tkm.KVOManagement.kvoManager";

@implementation NSObject (KVOManagement)

@dynamic kvoManager;

#pragma mark - Public methods

- (void)addObserverForKeyPath:(NSString*)keyPath andBlock:(KVOManagementCallback)callback
{
    [self addObserverForKeyPath:keyPath options:0 andBlock:callback];
}

- (void)addObserverForKeyPath:(NSString*)keyPath options:(NSKeyValueObservingOptions)options andBlock:(KVOManagementCallback)callback
{
    [self addObserverForKeyPath:keyPath options:options onQueue:nil andBlock:callback];
}

- (void)addObserverForKeyPath:(NSString*)keyPath options:(NSKeyValueObservingOptions)options onQueue:(NSOperationQueue*)queue andBlock:(KVOManagementCallback)callback
{
    // TODO: créer un KVOObservations
    // le garder en mémoire
}

- (void)observeObject:(id)object forKeyPath:(NSString*)keyPath andBlock:(KVOManagementCallback)callback
{
    [self observeObject:object forKeyPath:keyPath options:0 andBlock:callback];
}

- (void)observeObject:(id)object forKeyPath:(NSString*)keyPath options:(NSKeyValueObservingOptions)options andBlock:(KVOManagementCallback)callback
{
    [self observeObject:object forKeyPath:keyPath options:options onQueue:nil andBlock:callback];
}

- (void)observeObject:(id)object forKeyPath:(NSString*)keyPath options:(NSKeyValueObservingOptions)options onQueue:(NSOperationQueue*)queue andBlock:(KVOManagementCallback)callback
{
    // TODO
}

#pragma mark - Getters / Setters

- (KVOManager *)kvoManager
{
    KVOManager* manager = objc_getAssociatedObject(self, (__bridge void*)KVOManagementManagerKey);
    
    if (manager == nil)
    {
        manager = [KVOManager new];
        objc_setAssociatedObject(self, (__bridge void*)KVOManagementManagerKey, manager, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    
    return manager;
}

@end
