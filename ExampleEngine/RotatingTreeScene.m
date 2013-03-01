//
//  RotatingTreeScene.m
//  DS-OpenGL-Wrapper
//
//  Created by Sam Keene on 2/28/13.
//  Copyright (c) 2013 Ian Terrell. All rights reserved.
//

#import "RotatingTreeScene.h"
#import "Tree.h"
#import "Constants.h"

@implementation RotatingTreeScene
-(id)init {
    self = [super init];
    if (self) {
        Tree *tree = [[Tree alloc] init];
        tree.rotation = 0;
        tree.angularVelocity = M_TAU;
        tree.angularAcceleration = 0.5*M_TAU;
        [self.shapes addObject:tree];
    }
    return self;
}
@end
