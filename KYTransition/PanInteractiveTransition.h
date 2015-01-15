//
//  PanInteractiveTransition.h
//  KYTransition
//
//  Created by Kitten Yang on 1/15/15.
//  Copyright (c) 2015 Kitten Yang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PanInteractiveTransition : UIPercentDrivenInteractiveTransition
@property(nonatomic,assign)BOOL interacting;
-(void)panToDismiss:(UIViewController *)viewcontroller;
@end
