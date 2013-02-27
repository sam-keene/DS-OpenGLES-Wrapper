//
//  EEScene.h
//  ExampleEngine
//
//  Created by Sam Keene on 2/26/13.
//  Copyright (c) 2013 Ian Terrell. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <GLKit/GLKit.h>

@interface EEScene : NSObject
{
    //GLKBaseEffect *effect;
    GLKVector4 clearColor;
    float left, right, bottom, top;
}

@property GLKVector4 clearColor;
@property float left, right, bottom, top;

-(void)update;
-(void)render;
-(GLKMatrix4)projectionMatrix;

@end
