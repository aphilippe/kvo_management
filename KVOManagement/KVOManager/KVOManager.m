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
#import "KVOToken.h"

static long _counter = 0;

@interface KVOManager() <KVOObservationDelegate>

@property(nonatomic,readonly) NSMutableDictionary* observations;

- (KVOToken*)generateTokenForObservation:(KVOObservation*)observation;

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

- (KVOToken*)addObservation:(KVOObservation*)observation
{
    KVOToken* token = [self generateTokenForObservation:observation];

    [self.observations setValue:observation forKey:token.identifier];
    observation.delegate = self;
    [observation start];
    
    return token;
}

- (void)removeObservationWithToken:(KVOToken*)token
{
    [self.observations removeObjectForKey:token.identifier];
}

#pragma mark - Private methods

#pragma mark Getters / Setters

- (NSMutableDictionary*)observations
{
    if (_observations == nil)
    {
        _observations = [[NSMutableDictionary alloc] init];
    }
    
    return _observations;
}

- (KVOToken*)generateTokenForObservation:(KVOObservation*)observation
{
    _counter++;
    
    NSString* identifier = [NSString stringWithFormat:@"%ld", _counter];
    
    KVOToken* token = [KVOToken new];
    token.identifier = identifier;
    token.observee = observation.information.observee;
    
    return token;
}

#pragma mark - KVOObservationDelegate

- (void)observationDidStop:(KVOObservation *)observation
{
    // Stopped observation is delete from memory
    NSArray* tokens = [self.observations allKeysForObject:observation];
    for (KVOToken* tok in tokens) {
        [self.observations removeObjectForKey:tok];
    }
}

@end
