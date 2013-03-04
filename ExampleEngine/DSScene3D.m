//
//  DSScene3D.m
//  DS-OpenGL-Wrapper
//
//  Created by Sam Keene on 3/1/13.
//  Copyright (c) 2013 Ian Terrell. All rights reserved.
//

#import "DSScene3D.h"
#import "DSShape3D.h"
@implementation DSScene3D

@synthesize left, right, bottom, top, shapes, clearColor;

-(id)init {
    self = [super init];
    if (self) {
        shapes = [[NSMutableArray alloc] init];
    }
    return self;
}

-(void)update
{
    //NSLog(@"in DSScene's update %f", ((CGFloat)(rand()%1000)/1000));
}

-(void)render
{
    /*
    glClearColor(clearColor.r, clearColor.g, clearColor.b, clearColor.a);
    glClear(GL_COLOR_BUFFER_BIT);
    
    [shapes makeObjectsPerformSelector:@selector(renderInScene:) withObject:self];
     */
    glClearColor(clearColor.r, clearColor.g, clearColor.b, clearColor.a);
    glClear(GL_COLOR_BUFFER_BIT);
    
    //[self.effect prepareToDraw];
    
    //glBindVertexArrayOES(_vertexArray);
    // glDrawElements(GL_TRIANGLES, sizeof(Indices)/sizeof(Indices[0]), GL_UNSIGNED_BYTE, 0);
    [shapes makeObjectsPerformSelector:@selector(renderInScene:) withObject:self];
}

-(GLKMatrix4)projectionMatrix
{
    // size of the 3D world/space
    return GLKMatrix4MakeOrtho(left, right, bottom, top, 5, -5);
    
    // FOR 3D perspective:
    //float aspect = fabsf(4 / 3);
    //return GLKMatrix4MakePerspective(GLKMathDegreesToRadians(65.0f), aspect, 10.0f, -10.0f);
}

-(void)update:(NSTimeInterval)dt {
    [shapes enumerateObjectsUsingBlock:^(DSShape3D *shape, NSUInteger idx, BOOL *stop) {
        [shape update:dt];
    }];
}
@end
