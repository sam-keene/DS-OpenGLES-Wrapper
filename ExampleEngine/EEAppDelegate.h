//
//  EEAppDelegate.h
//  ExampleEngine
//
//  Created by Ian Terrell on 8/16/11.
//  Copyright (c) 2011 Ian Terrell. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <GLKit/GLKit.h>
#import "MainViewController.h"

@interface EEAppDelegate : UIResponder <UIApplicationDelegate>
{
    //EEScene *scene;
}

@property (strong, nonatomic) UIWindow *window;
@property (nonatomic, retain) UINavigationController *navigationController;
@property (nonatomic, retain) MainViewController *mainViewController;

@end
