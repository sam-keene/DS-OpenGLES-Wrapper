//
//  EquilateralTriangleScene.m
//  DS-OpenGL-Wrapper
//
//  Created by Sam Keene on 2/27/13.
//  Copyright (c) 2013 Ian Terrell. All rights reserved.
//

#import "EquilateralTriangleScene.h"
#import "Constants.h"

@implementation EquilateralTriangleScene
-(id)init {
        self = [super init];
        if (self) {
            triangle = [[EETriangle alloc] init];
            
            triangle.vertices[0] = GLKVector2Make(-1, -1);
            triangle.vertices[1] = GLKVector2Make( 1, -1);
            triangle.vertices[2] = GLKVector2Make( 0,  -1+2*sin(M_TAU/6));  //do a bit of math to work out the points for equilatteral triangle
            
            [triangle setTextureImage:[UIImage imageNamed:@"triangle.jpg"]];
            triangle.textureCoordinates[0] = GLKVector2Make(  0,0);
            triangle.textureCoordinates[1] = GLKVector2Make(  1,0);
            triangle.textureCoordinates[2] = GLKVector2Make(0.5,1);
        }
        return self;
}

-(void)render {
    [super render];
    [triangle renderInScene:self];
}

@end
