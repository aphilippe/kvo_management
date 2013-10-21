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

- (void)addObservationOnObject:(id)object forKeyPath:(NSString*)keyPath options:(NSKeyValueObservingOptions)options onQueue:(NSOperationQueue*)queue andBlock:(KVOManagementCallback)callback;

@end
