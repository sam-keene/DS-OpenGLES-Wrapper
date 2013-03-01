//
//  DSSceneController.h
//  ExampleEngine
//
//  Created by Sam Keene on 2/26/13.
//  Copyright (c) 2013 Ian Terrell. All rights reserved.
//

#import <GLKit/GLKit.h>
#import "DSScene3D.h"

@interface DSSceneController : GLKViewController
{
    float _curRed;
    BOOL _increasing;
    DSScene3D *scene;
    
}

@property (strong, nonatomic) EAGLContext *context;

@end
