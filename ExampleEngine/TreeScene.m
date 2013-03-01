//
//  TreeScene.m
//  DS-OpenGL-Wrapper
//
//  Created by Sam Keene on 2/27/13.
//  Copyright (c) 2013 Ian Terrell. All rights reserved.
//

#import "TreeScene.h"

@implementation TreeScene

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
        
        DSShape *tree = [[DSShape alloc] init];
        [tree addChild:trunk];
        [tree addChild:leaves];
        tree.scale = GLKVector2Make(0.5, 0.5);
        tree.position = GLKVector2Make(1,0);
        
        [self.shapes addObject:tree];
        
    }
    return self;
}


-(void)render {
    [super render];
    //[leaves renderInScene:self];
    //[trunk renderInScene:self];
}

@end
