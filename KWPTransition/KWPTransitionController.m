//
//  KWPTransitionController.m
//  KWPTransitionController
//
//  Created by 朴 根佑 on 2015/12/02.
//  Copyright © 2015年 KWP. All rights reserved.
//

#import "KWPTransitionController.h"

@interface KWPTransitionController ()

@end

@implementation KWPTransitionController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark KWPransitionAnimation

-(NSMutableArray*)transitionDestinationViewFrames
{
    [self.view layoutIfNeeded];
    return nil;
}

-(NSMutableArray*)transitionSourceViews
{
    [self.view layoutIfNeeded];
    return nil;
}

#pragma mark createDictionary

-(NSDictionary*)dictionaryOfFrame_key:(NSString *)key frame:(CGRect)frame
{
    NSMutableDictionary *tmpDic = [[NSMutableDictionary alloc] init];
    [tmpDic setObject:key forKey:@"key"];
    [tmpDic setObject:[NSValue valueWithCGRect:frame] forKey:@"value"];
    return tmpDic;
}

-(NSDictionary*)dictionaryOfView_key:(NSString*)key view:(UIView*)view
{
    NSMutableDictionary *tmpDic = [[NSMutableDictionary alloc] init];
    [tmpDic setObject:key forKey:@"key"];
    [tmpDic setObject:[self copyView:view] forKey:@"value"];
    return tmpDic;
}

-(UIButton*)copyButton:(UIButton*)sourceBtn
{
    UIButton *button = [[UIButton alloc] initWithFrame:sourceBtn.frame];
    button.titleLabel.text = sourceBtn.titleLabel.text;
    button.titleLabel.textColor = sourceBtn.titleLabel.textColor;
    button.titleLabel.textAlignment = sourceBtn.titleLabel.textAlignment;
    
//    button.imageView.image = sourceBtn.imageView.image;
    button.backgroundColor = sourceBtn.backgroundColor;
    
    return button;
}

-(UIView*)copyView:(UIView*)sourceView
{
    UIView *view = [sourceView snapshotViewAfterScreenUpdates:NO];
    view.frame = sourceView.frame;
    
    return view;
}
#pragma mark - (1) Animation
#pragma mark customの場合 UIViewControllerTransitioningDelegate

- (id <UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented
                                                                   presentingController:(UIViewController *)presenting
                                                                       sourceController:(UIViewController *)source
{
    NSLog(@"%s", __PRETTY_FUNCTION__);
    return [self setKWPAnimatinTransition_FromVC:source toVC:presented];
}
- (id <UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed
{
    NSLog(@"%s", __PRETTY_FUNCTION__);
    
    return [self setKWPAnimatinTransition_FromVC:dismissed toVC:nil];
    
}


#pragma mark navigationの場合 UINavigationControllerDelegate
- (id <UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController
                                   animationControllerForOperation:(UINavigationControllerOperation)operation
                                                fromViewController:(UIViewController *)fromVC
                                                  toViewController:(UIViewController *)toVC
{
    NSLog(@"%s", __PRETTY_FUNCTION__);
    
    switch(operation)
    {
        case UINavigationControllerOperationPush:
            return [[KWPAnimatedTransition alloc] init];
        case UINavigationControllerOperationPop:
            return [[KWPAnimatedTransition alloc] init];
        default:
            return nil;
    }
}

-(KWPAnimatedTransition*)setKWPAnimatinTransition_FromVC:(UIViewController*)fromVC toVC:(UIViewController*)toVC
{
    NSLog(@"%s", __PRETTY_FUNCTION__);
    
    id<KWPTransitionAnimating> sourceTransition = (id<KWPTransitionAnimating>)fromVC;
    id<KWPTransitionAnimating> destinationTransition = (id<KWPTransitionAnimating>)toVC;
    
    KWPAnimatedTransition *transition = [[KWPAnimatedTransition alloc] init];
    transition.sourceTransition = sourceTransition;
    transition.destinationTransition = destinationTransition;
    
    return transition;
}

@end
