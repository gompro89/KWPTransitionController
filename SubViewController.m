//
//  SubViewController.m
//  KWPTransitionController
//
//  Created by 朴 根佑 on 2015/12/02.
//  Copyright © 2015年 KWP. All rights reserved.
//

#import "SubViewController.h"

@interface SubViewController ()

@end

@implementation SubViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSMutableArray*)transitionDestinationViewFrames
{
    [super transitionDestinationViewFrames];
    
    [self.view layoutIfNeeded];
    
    NSMutableArray *frames = [[NSMutableArray alloc] init];
    NSLog(@" abcd %@" , NSStringFromCGRect(self.box.frame));
    
    [frames addObject:[self dictionaryOfFrame_key:@"button" frame:self.box.frame]];
    [frames addObject:[self dictionaryOfFrame_key:@"testView" frame:self.testView.frame]];
    
    return frames;
}

-(NSMutableArray*)transitionSourceViews
{
    [super transitionSourceViews];
    
    NSMutableArray *sourceViews = [[NSMutableArray alloc] init];
    [sourceViews addObject:[self dictionaryOfView_key:@"button" view:self.box]];
    
    [sourceViews addObject:[self dictionaryOfView_key:@"testView" view:self.box]];
    
    return sourceViews;
}
@end
