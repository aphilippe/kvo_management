//
//  ViewController.m
//  KVOManagerTestApplication
//
//  Created by Adrien Philippe on 15/10/13.
//  Copyright (c) 2013 tkm. All rights reserved.
//

#import "ViewController.h"
#import "NSObject+KVOManagement.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    [self observeObject:self atKeypath:@"count" andBlock:^(id object, NSDictionary *change) {
        NSLog(@"It's working !!!");
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

@end
