//
//  ViewController.m
//  KYTransition
//
//  Created by Kitten Yang on 1/14/15.
//  Copyright (c) 2015 Kitten Yang. All rights reserved.
//

#import "ViewController.h"
#import "PresentedViewController.h"
#import "RotationPresentAnimation.h"
#import "RotationDismissAnimation.h"
#import "PanInteractiveTransition.h"

@interface ViewController ()<PresentedVCDelegate,UIViewControllerTransitioningDelegate>

@property(nonatomic,strong)RotationPresentAnimation *presentAnimation;
@property(nonatomic,strong)RotationDismissAnimation *dismissAnimation;
@property(nonatomic,strong)PanInteractiveTransition *panInteractiveTransition;
@end

@implementation ViewController


-(instancetype)initWithCoder:(NSCoder *)aDecoder{
    self = [super initWithCoder:aDecoder];
    if (self) {
        self.presentAnimation = [[RotationPresentAnimation alloc]init];
        self.panInteractiveTransition = [[PanInteractiveTransition alloc]init];
        self.dismissAnimation = [[RotationDismissAnimation alloc]init];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    PresentedViewController *pvc = segue.destinationViewController;
    pvc.delegate = self;
    pvc.transitioningDelegate = self;
    [self.panInteractiveTransition panToDismiss:pvc];
}

#pragma mark - PresentedVCDelegate /dismiss
-(void)didPresentedVC:(PresentedViewController *)viewcontroller{
    [self dismissViewControllerAnimated:YES completion:nil];
}


#pragma mark - TransitioningDelegate /system
- (id <UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source{
    return self.presentAnimation;
}


//-(id<UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed
//{
//    return self.dismissAnimation;
//}


- (id <UIViewControllerInteractiveTransitioning>)interactionControllerForDismissal:(id <UIViewControllerAnimatedTransitioning>)animator{

    return self.panInteractiveTransition.interacting ? self.panInteractiveTransition : nil;
}


@end
