//
//  KVOObservation.m
//  KVOManagerTestApplication
//
//  Created by Adrien Philippe on 16/10/13.
//  Copyright (c) 2013 tkm. All rights reserved.
//

#import "KVOObservation.h"
#import "KVOObservationInformation.h"

static NSString* const KVOContext = @"KVOContext";

@interface KVOObservation()

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

#pragma mark - Private methods

- (void)start
{
    [_information.observee addObserver:self forKeyPath:_information.keypath options:0 context:(__bridge void*)KVOContext];
}

#pragma mark - Override

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    if ([keyPath isEqualToString:_information.keypath] && object == _information.observee && context == (__bridge void*)KVOContext)
    {
        _information.callback(_information.observee, change);
    }
}

@end
