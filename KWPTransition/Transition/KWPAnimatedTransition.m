//
//  KWPAnimatedTransition.m
//  KWPTransitionController
//
//  Created by 朴 根佑 on 2015/12/02.
//  Copyright © 2015年 KWP. All rights reserved.
//

#import "KWPAnimatedTransition.h"

@implementation KWPAnimatedTransition

#define kTransitionDuration 0.2

#pragma mark UIViewControllerAnimatedTransitioning

// アニメーション時間
- (NSTimeInterval)transitionDuration:(id <UIViewControllerContextTransitioning>)transitionContext
{
    NSLog(@"%s", __PRETTY_FUNCTION__);
    return kTransitionDuration;
}

// アニメーション処理
- (void)animateTransition:(id <UIViewControllerContextTransitioning>)transitionContext
{
    NSLog(@"%s", __PRETTY_FUNCTION__);
    
    //fade the new view in
    //example1
//    UIViewController* toController = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
//    UIViewController* fromController = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
//    UIView* container = [transitionContext containerView];
//    
//    toController.view.alpha = 0.0f;
//    [container addSubview:toController.view];
//    
//    [UIView animateWithDuration:kTransitionDuration animations:^{
//        toController.view.alpha = 1.0f;
//    } completion:^(BOOL finished){
//        [fromController.view removeFromSuperview];
//        [transitionContext completeTransition:finished];
//    }];
    
    
    //example2
    UIViewController* toController = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    UIViewController* fromController = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIView* container = [transitionContext containerView];
    
    toController.view.alpha = 0;
    [container addSubview:toController.view];
    
    // Without animation when you have not confirm the protocol
    Protocol *animating = @protocol(KWPTransitionAnimating);
    BOOL doesNotConfirmProtocol = ![self.sourceTransition conformsToProtocol:animating] || ![self.destinationTransition conformsToProtocol:animating];
    if (doesNotConfirmProtocol) {
        [transitionContext completeTransition:![transitionContext transitionWasCancelled]];
        return;
    }
    
    UIView *alphaView = [[UIView alloc] initWithFrame:[transitionContext finalFrameForViewController:toController]];
    [container addSubview:alphaView];
    
    NSMutableArray *sourceViews = [self.sourceTransition transitionSourceViews];
    NSMutableArray *destinationViewsFrames = [self.destinationTransition transitionDestinationViewFrames];
    
    BOOL validCheck = false;
    
    if ([sourceViews count] == [destinationViewsFrames count] ) {
        for (int i = 0; i < [sourceViews count]; i++)
        {
            validCheck = [[[sourceViews objectAtIndex:i] objectForKey:@"key"] isEqualToString:[[destinationViewsFrames objectAtIndex:i] objectForKey:@"key"]];
        }
    }
    
    if (!validCheck) {
        [transitionContext completeTransition:![transitionContext transitionWasCancelled]];
        return;
    }
    
    for (int i = 0 ; i < [sourceViews count]; i++) {
        UIView *view = (UIView*)[[sourceViews objectAtIndex:i] objectForKey:@"value"];
        [container addSubview:view];
        
        [UIView animateWithDuration:kTransitionDuration
                              delay:0
                            options:UIViewAnimationOptionCurveEaseOut
                         animations:^{
                             
                             NSLog(@"%@" , NSStringFromCGRect(view.frame));
                             
                            view.frame = [[[destinationViewsFrames objectAtIndex:i] objectForKey:@"value"] CGRectValue];
                             view.transform = CGAffineTransformMakeScale(1.02, 1.02);
                             
                             NSLog(@"%@" , NSStringFromCGRect(view.frame));
                             
                             
                             alphaView.alpha = 0.9;
                         }
         
                         completion:^(BOOL finished) {
                             [UIView animateWithDuration:kTransitionDuration
                                                   delay:0
                                                 options:UIViewAnimationOptionCurveEaseOut
                                              animations:^{
                                                  alphaView.alpha = 0;
                                                  view.transform = CGAffineTransformIdentity;
                                                  toController.view.alpha = 1;
                                              }
                                              completion:^(BOOL finished) {
                                                  view.alpha = 0;
                                                  //                                              if ([self.destinationTransition conformsToProtocol:@protocol(RMPZoomTransitionAnimating)] &&
                                                  //                                                  [self.destinationTransition respondsToSelector:@selector(zoomTransitionAnimator:didCompleteTransition:animatingSourceImageView:)]) {
                                                  //                                                  [self.destinationTransition zoomTransitionAnimator:self
                                                  //                                                                               didCompleteTransition:![transitionContext transitionWasCancelled]
                                                  //                                                                            animatingSourceImageView:sourceImageView];
                                                  //                                              }
                                                  [fromController.view removeFromSuperview];
                                                  
                                                  [transitionContext completeTransition:![transitionContext transitionWasCancelled]];
                                              }];
                         }];
    
    };
}

@end
