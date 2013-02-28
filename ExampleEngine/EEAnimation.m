//
//  EEAnimation.m
//  DS-OpenGL-Wrapper
//
//  Created by Sam Keene on 2/28/13.
//  Copyright (c) 2013 Ian Terrell. All rights reserved.
//

/*
 TODOs for animation class:
 
 Animate the scene’s projection matrix.
 Create temporary animations that act only on the modelview matrix.
 Create reversible animations.
 Create repeating animations.
 Create animations with nonlinear tweening, i.e. “ease in” or “ease out”.
 */

#import "EEAnimation.h"
#import "EEShape.h"

@implementation EEAnimation
@synthesize duration, elapsedTime, positionDelta, rotationDelta, scaleDelta, colorDelta;

-(id)init
{
    self = [super init];
    if (self) {
        self.rotationDelta = 0;
        self.scaleDelta = GLKVector2Make(0,0);
        self.colorDelta = GLKVector4Make(0,0,0,0);   
        self.elapsedTime = 0;
        self.duration = 0;
        self.positionDelta = GLKVector2Make(0,0);
    }
    return self;
}

-(void)animateShape:(EEShape *)shape dt:(NSTimeInterval)dt
{
    self.elapsedTime += dt;
    
    //adjust our time step to make sure we don’t overshoot our expected value.
    if (self.elapsedTime > self.duration)
        dt -= self.elapsedTime - self.duration;
    
    float fractionOfDuration = dt/self.duration;
    
    GLKVector2 positionIncrement = GLKVector2MultiplyScalar(self.positionDelta, fractionOfDuration);
    shape.position = GLKVector2Add(shape.position, positionIncrement);
    
    GLKVector4 colorIncrement = GLKVector4MultiplyScalar(self.colorDelta, fractionOfDuration);
    shape.color = GLKVector4Add(shape.color, colorIncrement);
    
    GLKVector2 scaleIncrement = GLKVector2MultiplyScalar(self.scaleDelta, fractionOfDuration);
    shape.scale = GLKVector2Add(shape.scale, scaleIncrement);
    
    shape.rotation += self.rotationDelta * fractionOfDuration;
}
@end
