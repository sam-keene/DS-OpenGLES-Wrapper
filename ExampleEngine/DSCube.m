//
//  DSCube.m
//  DS-OpenGL-Wrapper
//
//  Created by Sam Keene on 3/1/13.
//  Copyright (c) 2013 Ian Terrell. All rights reserved.
//

#import "DSCube.h"

@implementation DSCube
@synthesize vertices;

-(int)numVertices
{
    return 24;
}


-(void)updateVertices
{
     // Front
    self.vertices3D[0] = GLKVector3Make( 1.0, -1.0, 1.0);
    self.vertices3D[1] = GLKVector3Make( 1.0,  1.0, 1.0);
    self.vertices3D[2] = GLKVector3Make(-1.0,  1.0, 1.0);
    self.vertices3D[3] = GLKVector3Make(1.0, -1.0, 1.0);
    // Back
    self.vertices3D[4] = GLKVector3Make( 1.0, 1.0, -2.0);
    self.vertices3D[5] = GLKVector3Make( -1.0,  -1.0, -2.0);
    self.vertices3D[6] = GLKVector3Make(1.0,  -1.0, -2.0);
    self.vertices3D[7] = GLKVector3Make(-1.0, 1.0, -2.0);
    // Left
    self.vertices3D[8] = GLKVector3Make( -1.0, -1.0, 1.0);
    self.vertices3D[9] = GLKVector3Make( -1.0,  1.0, 1.0);
    self.vertices3D[10] = GLKVector3Make(-1.0,  1.0, -2.0);
    self.vertices3D[11] = GLKVector3Make(-1.0, -1.0, -2.0);
    // Right
    self.vertices3D[12] = GLKVector3Make( 1.0, -1.0, -2.0);
    self.vertices3D[13] = GLKVector3Make( 1.0,  1.0, -2.0);
    self.vertices3D[14] = GLKVector3Make(1.0,  1.0, 1.0);
    self.vertices3D[15] = GLKVector3Make(1.0, -1.0, 1.0);
    // Top
    self.vertices3D[16] = GLKVector3Make( 1.0, 1.0, 1.0);
    self.vertices3D[17] = GLKVector3Make( 1.0,  1.0, -2.0);
    self.vertices3D[18] = GLKVector3Make(-1.0,  1.0, -2.0);
    self.vertices3D[19] = GLKVector3Make(-1.0, 1.0, 1.0);
    // Bottom
    self.vertices3D[20] = GLKVector3Make( 1.0, -1.0, -2.0);
    self.vertices3D[21] = GLKVector3Make( 1.0,  -1.0, 1.0);
    self.vertices3D[22] = GLKVector3Make(-1.0,  -1.0, 1.0);
    self.vertices3D[23] = GLKVector3Make(-1.0, -1.0, -2.0);
}

-(float)width
{
    return width;
}

-(void)setWidth:(float)_width
{
    width = _width;
    [self updateVertices];
}

-(float)height
{
    return height;
}

-(void)setHeight:(float)_height
{
    height = _height;
    [self updateVertices];
}

@end
