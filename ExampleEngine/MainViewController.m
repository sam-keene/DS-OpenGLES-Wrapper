//
//  MainViewController.m
//  DS-OpenGL-Wrapper
//
//  Created by Sam Keene on 2/28/13.
//  Copyright (c) 2013 Ian Terrell. All rights reserved.
//

#import "MainViewController.h"
#import "EESceneController.h"
#import "ComplexAnimationScenen.h"

@interface MainViewController ()

@end

@implementation MainViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
}

-(void)viewDidAppear:(BOOL)animated{
    
    NSLog(@"viewDidAppear");
    EAGLContext *context = [[EAGLContext alloc] initWithAPI:kEAGLRenderingAPIOpenGLES2];
    [EAGLContext setCurrentContext:context];
    
    GLKView *view = [[GLKView alloc] initWithFrame:[[UIScreen mainScreen] bounds] context:context];
    view.delegate = self;
    
    EESceneController *controller = [[EESceneController alloc] init];
    controller.delegate = self;
    controller.view = view;
    
    //UINavigationController *navigationController = [[UINavigationController alloc] init];
    [self.navigationController pushViewController:controller animated:YES];
    
    //self.view = controller.view;
    //self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    //self.window.rootViewController = controller;
    //[self.window makeKeyAndVisible];
    
    scene = [[ComplexAnimationScenen alloc] init];
    scene.clearColor = GLKVector4Make(0.1, 0.9, 0.9, 0.0);
    scene.left   = -3;
    scene.right  =  3;
    scene.bottom = -2;
    scene.top    =  2;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
