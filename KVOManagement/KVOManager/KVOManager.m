//
//  KVOManager.m
//  KVOManagerTestApplication
//
//  Created by Adrien Philippe on 16/10/13.
//  Copyright (c) 2013 tkm. All rights reserved.
//

#import "KVOManager.h"
#import "KVOObservation.h"
#import "KVOObservationInformation.h"

@interface KVOManager()

@property(nonatomic,readonly) NSMutableArray* observations;

@end

@implementation KVOManager

@dynamic observations;

#pragma mark - Life cycle

- (id)initWithObject:(id)object
{
    self = [super init];
    
    if (self)
    {
        _object = object;
    }
    
    return self;
}

#pragma mark - Public methods

- (void)addObservation:(KVOObservation*)observation
{
    [self.observations addObject:observation];
    [observation start];
}

#pragma mark - Private methods

#pragma mark Getters / Setters

- (NSMutableArray*)observations
{
    if (_observations == nil)
    {
        _observations = [[NSMutableArray alloc] init];
    }
    
    return _observations;
}

@end
