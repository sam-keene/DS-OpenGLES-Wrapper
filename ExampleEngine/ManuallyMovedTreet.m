//
//  ManuallyMovedTreet.m
//  DS-OpenGL-Wrapper
//
//  Created by Sam Keene on 2/28/13.
//  Copyright (c) 2013 Ian Terrell. All rights reserved.
//

#import "ManuallyMovedTreet.h"
#import "Tree.h"
#import "EEAnimation.h"

@implementation ManuallyMovedTreet
-(id)init {
    self = [super init];
    if (self) {
        Tree *tree = [[Tree alloc] init];
        tree.position = GLKVector2Make(-1.5,0);
        
        EEAnimation *moveRightAnimation = [[EEAnimation alloc] init];
        moveRightAnimation.positionDelta = GLKVector2Make(3, 0);
        moveRightAnimation.duration = 3;
        [tree.animations addObject:moveRightAnimation];
        
        [self.shapes addObject:tree];
    }
    return self;
}
@end
