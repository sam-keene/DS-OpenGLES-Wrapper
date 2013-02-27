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
        triangle = [[EETriangle alloc] init];
        triangle.vertices[0] = GLKVector2Make(-1, -1);
        triangle.vertices[1] = GLKVector2Make( 1, -1);
        triangle.vertices[2] = GLKVector2Make( 0,  1);
    }
    return self;
}

-(void)render {
    [super render];
    [triangle renderInScene:self];
}
@end
