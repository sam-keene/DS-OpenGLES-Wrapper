//
//  DSAnimation.m
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
 Create animations with nonlinear twDSning, i.e. “ease in” or “ease out”.
 */

#import "DSAnimation.h"
#import "DSShape.h"
#import "DSShape3D.h"

@implementation DSAnimation
@synthesize duration, elapsedTime, positionDelta, rotationDelta, scaleDelta, colorDelta, positionDelta3D;

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

-(void)animateShape:(DSShape *)shape dt:(NSTimeInterval)dt
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

-(void)animateShape3D:(DSShape3D *)aShape dt:(NSTimeInterval)dt
{
    self.elapsedTime += dt;
    
    //adjust our time step to make sure we don’t overshoot our expected value.
    if (self.elapsedTime > self.duration)
        dt -= self.elapsedTime - self.duration;
    
    float fractionOfDuration = dt/self.duration;
    
    GLKVector3 positionIncrement = GLKVector3MultiplyScalar(self.positionDelta3D, fractionOfDuration);
    aShape.position = GLKVector3Add(aShape.position, positionIncrement);
    
    GLKVector4 colorIncrement = GLKVector4MultiplyScalar(self.colorDelta, fractionOfDuration);
    aShape.color = GLKVector4Add(aShape.color, colorIncrement);
    
    GLKVector2 scaleIncrement = GLKVector2MultiplyScalar(self.scaleDelta, fractionOfDuration);
    aShape.scale = GLKVector2Add(aShape.scale, scaleIncrement);
    
    aShape.rotation += self.rotationDelta * fractionOfDuration;
    
}
@end
