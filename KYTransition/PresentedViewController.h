//
//  PresentViewController.h
//  KYTransition
//
//  Created by Kitten Yang on 1/14/15.
//  Copyright (c) 2015 Kitten Yang. All rights reserved.
//

#import <UIKit/UIKit.h>

@class PresentedViewController;
@protocol PresentedVCDelegate <NSObject>

-(void)didPresentedVC:(PresentedViewController *)viewcontroller;

@end


@interface PresentedViewController : UIViewController
@property(nonatomic,weak) id<PresentedVCDelegate>delegate;

@end
