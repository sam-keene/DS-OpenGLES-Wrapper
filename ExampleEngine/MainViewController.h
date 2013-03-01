//
//  MainViewController.h
//  DS-OpenGL-Wrapper
//
//  Created by Sam Keene on 2/28/13.
//  Copyright (c) 2013 Ian Terrell. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <GLKit/GLKit.h>
#import "EEScene.h"

@interface MainViewController : UIViewController <GLKViewDelegate, GLKViewControllerDelegate>{
    EEScene *scene;
}

@end
