//
//  DSScene3D.h
//  DS-OpenGL-Wrapper
//
//  Created by Sam Keene on 3/1/13.
//  Copyright (c) 2013 Ian Terrell. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <GLKit/GLKit.h>

@interface DSScene3D : NSObject
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
-(void)update:(NSTimeInterval)dt;

@end
