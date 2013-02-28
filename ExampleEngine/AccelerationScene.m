//
//  AccelerationScene.m
//  DS-OpenGL-Wrapper
//
//  Created by Sam Keene on 2/28/13.
//  Copyright (c) 2013 Ian Terrell. All rights reserved.
//

#import "AccelerationScene.h"
#import "EEElipse.h"

@implementation AccelerationScene
-(id)init
{
    self = [super init];
    if (self) {
        EEElipse *ball = [[EEElipse alloc] init];
        ball.radiusX = 0.2;
        ball.radiusY = 0.2;
        ball.color = GLKVector4Make(1, 0, 0, 1);
        ball.position = GLKVector2Make(-3,-2);
        ball.velocity = GLKVector2Make(1,2.5);
        ball.acceleration = GLKVector2Make(0,-1);
        
        [self.shapes addObject:ball];
    }
    return self;
}
@end
