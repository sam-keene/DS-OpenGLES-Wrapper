//
//  TriangleScene.m
//  ExampleEngine
//
//  Created by Sam Keene on 2/26/13.
//  Copyright (c) 2013 Ian Terrell. All rights reserved.
//

#import "TriangleScene.h"

@implementation TriangleScene
-(id)init {
    self = [super init];
    if (self) {
        NSLog(@"*** init Triangle 1");
        triangle = [[DSTriangle alloc] init];
        
        //draws the verticies
        triangle.vertices[0] = GLKVector2Make(-1, -1);
        triangle.vertices[1] = GLKVector2Make( 1, -1);
        triangle.vertices[2] = GLKVector2Make( 0,  1);
        
        triangle.useConstantColor = NO;
        //draws the colors to the vertices
        triangle.vertexColors[0] = GLKVector4Make(1,0,0,1);
        triangle.vertexColors[1] = GLKVector4Make(0,1,0,1);
        triangle.vertexColors[2] = GLKVector4Make(0,0,1,1);
        NSLog(@"*** init Triangle 2");
    }
    return self;
}

-(void)render {
    [super render];
    [triangle renderInScene:self];
}
@end
