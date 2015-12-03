//
//  KWPTransitionController.h
//  KWPTransitionController
//
//  Created by 朴 根佑 on 2015/12/02.
//  Copyright © 2015年 KWP. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "KWPAnimatedTransition.h"

@interface KWPTransitionController : UIViewController<UIViewControllerTransitioningDelegate,UINavigationControllerDelegate,KWPTransitionAnimating>

-(NSMutableArray*)transitionSourceViews;
-(NSMutableArray*)transitionDestinationViewFrames;

-(NSDictionary*)dictionaryOfView_key:(NSString*)key view:(UIView*)view;
-(NSDictionary*)dictionaryOfFrame_key:(NSString*)key frame:(CGRect)frame;
@end
