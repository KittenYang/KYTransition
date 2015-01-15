//
//  PanInteractiveTransition.m
//  KYTransition
//
//  Created by Kitten Yang on 1/15/15.
//  Copyright (c) 2015 Kitten Yang. All rights reserved.
//



#import "PanInteractiveTransition.h"

@interface PanInteractiveTransition()
@property(nonatomic,strong)UIViewController *presentedVC;
@property(nonatomic,assign)BOOL critical;

@end

@implementation PanInteractiveTransition


-(void)panToDismiss:(UIViewController *)viewcontroller{
    self.presentedVC = viewcontroller;
    UIPanGestureRecognizer *panGstR = [[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(panGestureAction:)];
    [self.presentedVC.view addGestureRecognizer:panGstR];

}

#pragma mark -panGestureAction
-(void)panGestureAction:(UIPanGestureRecognizer *)gesture{
    CGPoint translation = [gesture translationInView:self.presentedVC.view];
    switch (gesture.state) {
        case UIGestureRecognizerStateBegan:{
            self.interacting =  YES;
            [self.presentedVC dismissViewControllerAnimated:YES completion:nil];
            break;
        }
        case UIGestureRecognizerStateChanged:{
            //1.这里数据可以自己慢慢调
            CGFloat percent = (translation.y/1800) <= 1 ? (translation.y/1800):1;
            self.critical = (percent > 0.04);
            [self updateInteractiveTransition:percent];
            
            break;
        }
        case UIGestureRecognizerStateCancelled:
        case UIGestureRecognizerStateEnded:{
            //2
            self.interacting = NO;
            if (gesture.state == UIGestureRecognizerStateCancelled || !self.critical) {
                [self cancelInteractiveTransition];
            }else{
                [self finishInteractiveTransition];
            }
            break;
        }
            
        default:
            break;
    }
}


@end

