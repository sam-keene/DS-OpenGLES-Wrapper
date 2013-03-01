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

@interface DSAnimation : NSObject
{
    float rotationDelta;
    GLKVector2 scaleDelta;
    GLKVector4 colorDelta;
    
    NSTimeInterval duration, elapsedTime;
    GLKVector2 positionDelta;
}

@property NSTimeInterval duration;
@property NSTimeInterval elapsedTime;
@property GLKVector2 positionDelta;
@property float rotationDelta;
@property GLKVector2 scaleDelta;
@property GLKVector4 colorDelta;

-(void)animateShape:(DSShape *)shape dt:(NSTimeInterval)dt;

@end
