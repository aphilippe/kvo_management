//
//  ViewController.m
//  KVOManagerTestApplication
//
//  Created by Adrien Philippe on 15/10/13.
//  Copyright (c) 2013 tkm. All rights reserved.
//

#import "ViewController.h"
#import "NSObject+KVOManagement.h"


@interface Object : NSObject

@property(nonatomic, readwrite) int count;

@end

@implementation Object



@end


@interface ViewController ()
{
    Object* _object;
    __weak KVOManager* plop;
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
    [self observeObject:_object atKeypath:@"count" andBlock:^(id object, NSDictionary *change) {
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
    self.count++;
}

- (IBAction)selectObject:(id)sender
{
    _object.count++;
    _object = nil;
}

@end
