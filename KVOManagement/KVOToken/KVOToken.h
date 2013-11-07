//
//  KVOToken.h
//  KVOManagerTestApplication
//
//  Created by Adrien Philippe on 07/11/13.
//  Copyright (c) 2013 tkm. All rights reserved.
//

#import <Foundation/Foundation.h>

// A simple class used to find the observation

@interface KVOToken : NSObject
@property(nonatomic, weak) id observee;
@property(nonatomic, copy) NSString* identifier;

@end

