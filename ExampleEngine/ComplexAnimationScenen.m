//
//  ComplexAnimationScenen.m
//  DS-OpenGL-Wrapper
//
//  Created by Sam Keene on 2/28/13.
//  Copyright (c) 2013 Ian Terrell. All rights reserved.
//

#import "ComplexAnimationScenen.h"
#import "EERectangle.h"
#import "EEAnimation.h"
#import "Constants.h"
#import "Tree.h"
#import "EEElipse.h"

@implementation ComplexAnimationScenen
-(id)init {
    self = [super init];
    if (self) {
        
        Tree *tree = [[Tree alloc] init];
        tree.position = GLKVector2Make(-1.5,0);
        tree.position = GLKVector2Make(-1, -1);
        tree.scale = GLKVector2Make(0.5, 1);
        tree.color = GLKVector4Make(1, 0, 0, .5);
        //using the animation factory method:
        [tree animateWithDuration:3 animations:^() {
            tree.position = GLKVector2Make(1.5,0);
            tree.scale = GLKVector2Make(1, -0.5);
            tree.rotation = M_TAU;
            tree.color = GLKVector4Make(0, 0, 0, 1);
        }];
        [self.shapes addObject:tree];
        
        EEElipse *ball = [[EEElipse alloc] init];
        ball.radiusX = 1;
        ball.radiusY = 1;
        ball.color = GLKVector4Make(0.9, 0.1, 0.1, 1);
        [ball animateWithDuration:3 animations:^() {
            ball.color = GLKVector4Make(0, 0.4, 0.9, 1);
        }];
        [self.shapes addObject:ball];
        
        /// OR CAN HARDCOE OUR ANIMATIONS LIEK THIS :
        /*
        EERectangle *rectangle = [[EERectangle alloc] init];
        rectangle.position = GLKVector2Make(-1, -1);
        rectangle.width = 2;
        rectangle.height = 1;
        rectangle.scale = GLKVector2Make(0.5, 1);
        rectangle.color = GLKVector4Make(1, 0, 0, .5);
        
        //FIRST ANIMATION
        EEAnimation *complexAnimation = [[EEAnimation alloc] init];
        complexAnimation.positionDelta = GLKVector2Make(2, 2);
        complexAnimation.scaleDelta = GLKVector2Make(1, -0.5);
        complexAnimation.rotationDelta = M_TAU;
        complexAnimation.colorDelta = GLKVector4Make(0, 0, 0, 1);
        complexAnimation.duration = 3;
        [rectangle.animations addObject:complexAnimation];
        
        //SECOND ANIMATION
        EEAnimation *secondAnimation = [[EEAnimation alloc] init];
        secondAnimation.positionDelta = GLKVector2Make(-1,-1);
        secondAnimation.rotationDelta = M_TAU;
        secondAnimation.colorDelta = GLKVector4Make(0, 1, 0, 0);
        secondAnimation.duration = 2;
        [rectangle.animations addObject:secondAnimation];
        
        [self.shapes addObject:rectangle];
         */
    }
    return self;
}
@end
