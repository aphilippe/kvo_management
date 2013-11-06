//
//  KVOObservation.h
//  KVOManagerTestApplication
//
//  Created by Adrien Philippe on 16/10/13.
//  Copyright (c) 2013 tkm. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "KVOManagementConstants.h"

@class KVOObservationInformation;
@protocol KVOObservationDelegate;

@interface KVOObservation : NSObject
{
    KVOObservationInformation* _information;
    dispatch_once_t removeObserverDispatchOnce;
}

@property(nonatomic, weak) id<KVOObservationDelegate> delegate;
@property(nonatomic, readonly) KVOObservationInformation* information;

- (id)initWithInformation:(KVOObservationInformation*)information;
- (void)start;

@end

@protocol KVOObservationDelegate <NSObject>

@required
- (void)observationDidStop:(KVOObservation*)observation;

@end