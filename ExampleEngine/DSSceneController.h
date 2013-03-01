//
//  DSSceneController.h
//  ExampleEngine
//
//  Created by Sam Keene on 2/26/13.
//  Copyright (c) 2013 Ian Terrell. All rights reserved.
//

#import <GLKit/GLKit.h>
#import "DSScene.h"

@interface DSSceneController : GLKViewController
{
    float _curRed;
    BOOL _increasing;
    DSScene *scene;
}

@property (strong, nonatomic) EAGLContext *context;

@end
