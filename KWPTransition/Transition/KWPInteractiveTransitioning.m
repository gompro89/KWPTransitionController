//
//  KWPInteractiveTransitioning.m
//  KWPTransitionController
//
//  Created by 朴 根佑 on 2015/12/03.
//  Copyright © 2015年 KWP. All rights reserved.
//

#import "KWPInteractiveTransitioning.h"

@implementation KWPInteractiveTransitioning


#pragma mark - (2) Interactive Transitions
#pragma mark customの場合　UIViewControllerTransitioningDelegate
- (id <UIViewControllerInteractiveTransitioning>)interactionControllerForPresentation:(id<UIViewControllerAnimatedTransitioning>)animator
{
    NSLog(@"%s", __PRETTY_FUNCTION__);
    return nil;
}
- (id <UIViewControllerInteractiveTransitioning>)interactionControllerForDismissal:(id<UIViewControllerAnimatedTransitioning>)animator
{
    NSLog(@"%s", __PRETTY_FUNCTION__);
    return nil;
}

#pragma mark navigationの場合　UINavigationControllerDelegate
- (id <UIViewControllerInteractiveTransitioning>)navigationController:(UINavigationController *)navigationController
                          interactionControllerForAnimationController:(id <UIViewControllerAnimatedTransitioning>)animationController
{
    NSLog(@"%s", __PRETTY_FUNCTION__);
    return nil;
    
}

#pragma mark　UIpercentDrivenInteractiveTransition
// 0.0〜1.0の値を代入する事で今どの状態なのかを指定する
- (void)updateInteractiveTransition:(CGFloat)percentComplete
{
    NSLog(@"%s", __PRETTY_FUNCTION__);
}
// 終了orキャンセル時にはこれを
- (void)finishInteractiveTransition
{
    NSLog(@"%s", __PRETTY_FUNCTION__);
    
}
- (void)cancelInteractiveTransition
{
    NSLog(@"%s", __PRETTY_FUNCTION__);
}

@end
