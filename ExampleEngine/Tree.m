//
//  Tree.m
//  DS-OpenGL-Wrapper
//
//  Created by Sam Keene on 2/28/13.
//  Copyright (c) 2013 Ian Terrell. All rights reserved.
//

#import "Tree.h"
#import "DSTriangle.h"
#import "DSRectangle.h"

@implementation Tree



/*
 EXAMPLE OF HOW TO MAKE A CUSTOM SHAPE THAT CAN THEN BE USED OVER AND OVER WITHOUT 
 SIGNIFICANT MEMORY USAGE
*/
-(id)init {
    self = [super init];
    if (self) {
        DSTriangle *leaves = [[DSTriangle alloc] init];
        leaves.vertices[0] = GLKVector2Make(-1, 0);
        leaves.vertices[1] = GLKVector2Make( 1, 0);
        leaves.vertices[2] = GLKVector2Make( 0, 3);
        leaves.position = GLKVector2Make(0,-1.2);
        leaves.color = GLKVector4Make(0, 0.5, 0, 1);
        
        DSRectangle *trunk = [[DSRectangle alloc] init];
        trunk.width = 0.4;
        trunk.height = 1;
        trunk.position = GLKVector2Make(0, -1.25);
        trunk.color = GLKVector4Make(0.4, 0.1, 0, 1);
        
        [self addChild:trunk];
        [self addChild:leaves];
    }
    return self;
}

@end
