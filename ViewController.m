//
//  ViewController.m
//  KWPTransitionController
//
//  Created by 朴 根佑 on 2015/12/02.
//  Copyright © 2015年 KWP. All rights reserved.
//

#import "ViewController.h"
#import "SubViewController.h"


@interface ViewController ()
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)transitionAction:(id)sender {
    
    //navigationの場合
    SubViewController *vc = [self.storyboard instantiateViewControllerWithIdentifier:@"SubViewController"];
//    self.navigationController.delegate = self;
//    [self.navigationController pushViewController:vc animated:YES];
    
    //customの場合
    vc.modalPresentationStyle = UIModalPresentationCustom;
    vc.transitioningDelegate = self;
    [self presentViewController:vc animated:YES completion:nil];
    
}

-(NSMutableArray*)transitionDestinationViewFrames
{
    [super transitionDestinationViewFrames];
    NSMutableArray *frames = [[NSMutableArray alloc] init];
    [frames addObject:[self dictionaryOfFrame_key:@"button" frame:self.button.frame]];
    [frames addObject:[self dictionaryOfFrame_key:@"testView" frame:self.testView.frame]];
    
    return frames;
}

-(NSMutableArray*)transitionSourceViews
{
    [super transitionSourceViews];
    NSMutableArray *sourceViews = [[NSMutableArray alloc] init];
    [sourceViews addObject:[self dictionaryOfView_key:@"button" view:self.button]];
    [sourceViews addObject:[self dictionaryOfView_key:@"testView" view:self.testView]];
    
    return sourceViews;
}

@end
