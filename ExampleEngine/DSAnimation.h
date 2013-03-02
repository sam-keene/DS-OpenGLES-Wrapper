//
//  DSAnimation.h
//  DS-OpenGL-Wrapper
//
//  Created by Sam Keene on 2/28/13.
//  Copyright (c) 2013 Ian Terrell. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <GLKit/GLKit.h>
#import "DSShape.h"
#import "DSShape3D.h"

@interface DSAnimation : NSObject
{
    float rotationDelta;
    GLKVector2 scaleDelta;
    GLKVector4 colorDelta;
    
    NSTimeInterval duration, elapsedTime;
    GLKVector2 positionDelta;
    GLKVector3 positionDelta3D;
}

@property NSTimeInterval duration;
@property NSTimeInterval elapsedTime;
@property GLKVector2 positionDelta;
@property float rotationDelta;
@property GLKVector2 scaleDelta;
@property GLKVector4 colorDelta;

//3D stuff
@property GLKVector3 positionDelta3D;

-(void)animateShape:(DSShape *)shape dt:(NSTimeInterval)dt;
-(void)animateShape3D:(DSShape3D *)shape dt:(NSTimeInterval)dt;

@end
