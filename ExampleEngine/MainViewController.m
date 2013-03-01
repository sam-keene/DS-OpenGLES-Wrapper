//
//  MainViewController.m
//  DS-OpenGL-Wrapper
//
//  Created by Sam Keene on 3/1/13.
//  Copyright (c) 2013 Ian Terrell. All rights reserved.
//

#import "MainViewController.h"
#import "EESceneController.h"
#import "TempViewController.h"

@interface MainViewController ()

@end

@implementation MainViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        NSLog(@"*** init");
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
     NSLog(@"*** viewDidLoad");
    [super viewDidLoad];
    self.navigationController.navigationBarHidden = YES;
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)btnTapped:(id)sender
{
    NSLog(@"**** PUSH THE GLKitVC");
    EESceneController *eESceneController = [[EESceneController alloc] init];
    [self.navigationController pushViewController:eESceneController animated:YES];
}

@end
