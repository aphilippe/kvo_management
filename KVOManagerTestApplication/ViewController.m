//
//  ViewController.m
//  KVOManagerTestApplication
//
//  Created by Adrien Philippe on 15/10/13.
//  Copyright (c) 2013 tkm. All rights reserved.
//

#import "ViewController.h"



@interface Object : NSObject

@property(nonatomic, readwrite) int count;

@end

@implementation Object

-(void)dealloc
{
    NSLog(@"plop");
}

@end


@interface ViewController ()
{
    Object* _object;
    KVOToken* _token;
}

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
//    [self observeObject:self atKeypath:@"count" andBlock:^(id object, NSDictionary *change) {
//        NSLog(@"self count changed");
//    }];
    
    _object = [Object new];
    _token = [self observeObject:_object atKeypath:@"count" andBlock:^(id object, NSDictionary *change) {
        NSLog(@"object count changed");
        
    }];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)selector:(id)sender
{
    [self removeObservationWithToken:_token];
}

- (IBAction)selectObject:(id)sender
{
    _object.count++;
}

@end
