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
    NSLog(@"object dealloc");
}

@end


@interface ViewController ()
{
    Object* _object;
    KVOToken* _token;
    KVOObservationInformation* _information;
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
//    _information = [[KVOObservationInformation alloc] init];
//    _information.observee = self;
//    _information.keypath = @"count";
//    _information.callback = ^(KVOObservationInformation* object, NSDictionary *change) {
//        NSLog(@"object count changed");
//    };
//    
//    _token = [_object observeWithInformation:_information];
    
    _token = [self observeWithInformationBlock:^(KVOObservationInformation *__autoreleasing *infos) {
        (*infos).observee = _object;
        (*infos).keypath = @"count";
        (*infos).callback = ^(KVOObservationInformation* object, NSDictionary* change){
            NSLog(@"Object count changed");
        };
        (*infos).queue = dispatch_get_main_queue();
    }];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)selector:(id)sender
{
//    [self removeObservationWithToken:_token];
    _object = nil;
}

- (IBAction)selectObject:(id)sender
{
    dispatch_async(dispatch_queue_create("plop", NULL), ^{
           _object.count++;
    });
}

@end
