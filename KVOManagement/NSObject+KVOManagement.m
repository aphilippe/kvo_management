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
#import "KVOObservation.h"
#import "KVOObservationInformation.h"

static const NSString* KVOManagementContext = @"KVOManagementContext";

static const NSString* KVOManagementManagerKey = @"com.tkm.KVOManagement.kvoManager";

@implementation NSObject (KVOManagement)

@dynamic kvoManager;

#pragma mark - Public methods

- (void)observeObject:(id)object atKeypath:(NSString*)keypath andBlock:(KVOManagementBlockCallback)callback
{
    KVOObservationInformation* information = [[KVOObservationInformation alloc] init];
    information.observee = object;
    information.observer = self;
    information.keypath = keypath;
    information.callback = callback;
    
    KVOObservation* observation = [[KVOObservation alloc] initWithInformation:information];
    
    [[object kvoManager] addObservation:observation];
}

#pragma mark - Getters / Setters

- (KVOManager *)kvoManager
{
    KVOManager* manager = objc_getAssociatedObject(self, (__bridge void*)KVOManagementManagerKey);
    
    if (manager == nil)
    {
        manager = [[KVOManager alloc] initWithObject:self];
        objc_setAssociatedObject(self, (__bridge void*)KVOManagementManagerKey, manager, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    
    return manager;
}

@end
