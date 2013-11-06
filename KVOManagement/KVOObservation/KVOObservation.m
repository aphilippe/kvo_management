//
//  KVOObservation.m
//  KVOManagerTestApplication
//
//  Created by Adrien Philippe on 16/10/13.
//  Copyright (c) 2013 tkm. All rights reserved.
//

#import "KVOObservation.h"
#import "KVOObservationInformation.h"

static void* KVOContext = &KVOContext;

@interface KVOObservation()

- (void)stop;

@end

@implementation KVOObservation

@synthesize information = _information;

#pragma mark - Life cycle

- (id)initWithInformation:(KVOObservationInformation*)information
{
    self = [super init];
    
    if (self)
    {
        _information = information;
    }
    
    return self;
}

- (void)dealloc
{
    [self stop];
}

#pragma mark - Private methods

- (void)start
{
    [_information.observee addObserver:self forKeyPath:_information.keypath options:0 context:KVOContext];
}

- (void)stop
{
    // Avoid crash if we stop multiple time
    dispatch_once(&removeObserverDispatchOnce, ^{
        [_information.observee removeObserver:self forKeyPath:_information.keypath context:KVOContext];
        
        [self.delegate observationDidStop:self];
    });
    
}

#pragma mark - Override

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    if ([keyPath isEqualToString:_information.keypath] && object == _information.observee && context == KVOContext)
    {
        if (self.information.observer == nil)
        {
            [self stop];
        }
        else
        {
            _information.callback(_information.observee, change);
        }
    }
    else
    {
        [super observeValueForKeyPath:keyPath ofObject:object change:change context:context];
    }
}

@end
