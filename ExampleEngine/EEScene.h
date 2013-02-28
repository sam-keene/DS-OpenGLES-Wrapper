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
    GLKVector4 clearColor;
    float left, right, bottom, top;
    NSMutableArray *shapes;
}

@property GLKVector4 clearColor;
@property float left, right, bottom, top;
@property(strong,readonly) NSMutableArray *shapes;

-(void)update;
-(void)render;
-(GLKMatrix4)projectionMatrix;
-(void)renderOnce;
-(void)update:(NSTimeInterval)dt;

@end
