//
//  EEScene.m
//  ExampleEngine
//
//  Created by Sam Keene on 2/26/13.
//  Copyright (c) 2013 Ian Terrell. All rights reserved.
//

#import "EEScene.h"
#import "EEShape.h"

@implementation EEScene

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
    //NSLog(@"in EEScene's update %f", ((CGFloat)(rand()%1000)/1000));
}

-(void)render
{
    glClearColor(clearColor.r, clearColor.g, clearColor.b, clearColor.a);
    glClear(GL_COLOR_BUFFER_BIT);
    
    [shapes makeObjectsPerformSelector:@selector(renderInScene:) withObject:self];
}

-(void)renderOnce
{
    glClearColor(clearColor.r, clearColor.g, clearColor.b, clearColor.a);
    glClear(GL_COLOR_BUFFER_BIT);
    
    [shapes makeObjectsPerformSelector:@selector(renderInScene:) withObject:self];
}

-(GLKMatrix4)projectionMatrix
{
    return GLKMatrix4MakeOrtho(left, right, bottom, top, 1, -1);
}

-(void)update:(NSTimeInterval)dt {
    [shapes enumerateObjectsUsingBlock:^(EEShape *shape, NSUInteger idx, BOOL *stop) {
        [shape update:dt];
    }];
}
@end
