//
//  ViewController.h
//  KWPTransitionController
//
//  Created by 朴 根佑 on 2015/12/02.
//  Copyright © 2015年 KWP. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "KWPTransitionController.h"
#import "KWPAnimatedTransition.h"
@interface ViewController : KWPTransitionController
@property (weak, nonatomic) IBOutlet UIButton *button;
@property (weak, nonatomic) IBOutlet UIView *testView;


@end

