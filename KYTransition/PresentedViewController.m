//
//  PresentViewController.m
//  KYTransition
//
//  Created by Kitten Yang on 1/14/15.
//  Copyright (c) 2015 Kitten Yang. All rights reserved.
//

#import "PresentedViewController.h"

@interface PresentedViewController ()

@end

@implementation PresentedViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)dismissClicked:(id)sender {
    if (self.delegate && [self.delegate respondsToSelector:@selector(didPresentedVC:)]) {
        [self.delegate didPresentedVC:self];
    }
}



@end
