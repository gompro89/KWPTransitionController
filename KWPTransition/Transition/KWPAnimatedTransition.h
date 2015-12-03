//
//  KWPAnimatedTransition.h
//  KWPTransitionController
//
//  Created by 朴 根佑 on 2015/12/02.
//  Copyright © 2015年 KWP. All rights reserved.
//

#import <Foundation/Foundation.h>
@import UIKit;

@protocol KWPTransitionAnimating <NSObject>
@required
- (NSMutableArray*)transitionDestinationViewFrames;
- (NSMutableArray *)transitionSourceViews;

@end

@interface KWPAnimatedTransition : NSObject <UIViewControllerAnimatedTransitioning>

@property (weak,nonatomic) id<KWPTransitionAnimating> sourceTransition;

@property (nonatomic, weak) id <KWPTransitionAnimating> destinationTransition;

@end
