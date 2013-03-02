//
//  DSScene.m
//  ExampleEngine
//
//  Created by Sam Keene on 2/26/13.
//  Copyright (c) 2013 Ian Terrell. All rights reserved.
//

#import "DSScene.h"
#import "DSShape.h"

@implementation DSScene

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
    glClearColor(clearColor.r, clearColor.g, clearColor.b, clearColor.a);
    glClear(GL_COLOR_BUFFER_BIT);
    
    [shapes makeObjectsPerformSelector:@selector(renderInScene:) withObject:self];
}

-(GLKMatrix4)projectionMatrix
{
    //float aspect = fabsf(self.view.bounds.size.width / self.view.bounds.size.height);
    float aspect = fabsf(480.0 / 320.0);
   // GLKMatrix4MakePerspective( GLKMathDegreesToRadians(65.0f), aspect, 4.0f, 10.0f);
    //self.effect.transform.projectionMatrix = projectionMatrix;
    
   
     return GLKMatrix4MakePerspective( GLKMathDegreesToRadians(65.0f), aspect, -10.0f, 10.0f);
     //return GLKMatrix4MakeOrtho(left, right, bottom, top, 1, -1);
}

-(void)update:(NSTimeInterval)dt {
    [shapes enumerateObjectsUsingBlock:^(DSShape *shape, NSUInteger idx, BOOL *stop) {
        [shape update:dt];
    }];
}
@end
