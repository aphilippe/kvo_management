//
//  KVOObservation.m
//  KVOManagerTestApplication
//
//  Created by Adrien Philippe on 16/10/13.
//  Copyright (c) 2013 tkm. All rights reserved.
//

#import "KVOObservation.h"
#import "KVOObservationInformation.h"

@interface KVOObservation()

- (void)start;

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
        
        [self start];
    }
    
    return self;
}

#pragma mark - Private methods

- (void)start
{
    // TODO
}

@end
