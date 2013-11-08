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
#import "KVOToken.h"

@interface NSObject()
@property(nonatomic, readonly, strong) KVOManager* kvoManager;

@end

static const NSString* KVOManagementContext = @"KVOManagementContext";

static const NSString* KVOManagementManagerKey = @"com.tkm.KVOManagement.kvoManager";

@implementation NSObject (KVOManagement)

#pragma mark - Public methods

- (KVOToken*)observeObject:(id)object atKeypath:(NSString*)keypath andBlock:(KVOManagementBlockCallback)callback
{
    KVOObservationInformation* information = [[KVOObservationInformation alloc] init];
    information.observee = object;
    information.keypath = keypath;
    information.callback = callback;
    
    return [self observeWithInformation:information];
}

- (KVOToken*)observeWithInformation:(KVOObservationInformation*)information
{
    [self validateInformation:&information];
    KVOObservation* observation = [[KVOObservation alloc] initWithInformation:information];
    
    return [[information.observee kvoManager] addObservation:observation];
}

- (void)removeObservationWithToken:(KVOToken*)token
{
    [[token.observee kvoManager] removeObservationWithToken:token];
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

#pragma mark - Private

- (void)validateInformation:(KVOObservationInformation**)information
{
    // Observer
    if ((*information).observer == nil)
    {
        (*information).observer = self;
    }
    
    // Observee
    if ((*information).observee == nil)
    {
        [NSException raise:@"KVOManagementException" format:@"You can not add observation wihtout an observee"];
    }
    
    // Keypath
    // TODO : trully validate the keypath
    if ((*information).keypath.length == 0)
    {
        [NSException raise:@"KVOManagementException" format:@"You can not add observation wihtout a keypath"];
    }
    
    // Callback
    if ((*information).callback == nil)
    {
        [NSException raise:@"KVOManagementException" format:@"You can not add observation wihtout a callback"];
    }
}

@end
