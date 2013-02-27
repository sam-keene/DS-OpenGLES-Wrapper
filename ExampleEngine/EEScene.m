//
//  EEScene.m
//  ExampleEngine
//
//  Created by Sam Keene on 2/26/13.
//  Copyright (c) 2013 Ian Terrell. All rights reserved.
//

#import "EEScene.h"

@implementation EEScene

@synthesize clearColor;
@synthesize left, right, bottom, top;

-(void)update
{
    //NSLog(@"in EEScene's update %f", ((CGFloat)(rand()%1000)/1000));
}

-(void)render
{
    glClearColor(clearColor.r, clearColor.g, clearColor.b, clearColor.a);
    glClear(GL_COLOR_BUFFER_BIT);
    
    //effect = [[GLKBaseEffect alloc] init];
    //effect.transform.projectionMatrix = GLKMatrix4MakeOrtho(left, right, bottom, top, 1, -1);
    //[effect prepareToDraw];
}

-(GLKMatrix4)projectionMatrix
{
    return GLKMatrix4MakeOrtho(left, right, bottom, top, 1, -1);
}
@end
