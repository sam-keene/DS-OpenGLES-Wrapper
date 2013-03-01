//
//  EESceneController.h
//  ExampleEngine
//
//  Created by Sam Keene on 2/26/13.
//  Copyright (c) 2013 Ian Terrell. All rights reserved.
//

#import <GLKit/GLKit.h>
#import "EEScene.h"

@interface EESceneController : GLKViewController
{
    float _curRed;
    BOOL _increasing;
    EEScene *scene;
}

@property (strong, nonatomic) EAGLContext *context;

@end
