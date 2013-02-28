//
//  EESpriteAnimation.h
//  DS-OpenGL-Wrapper
//
//  Created by Sam Keene on 2/28/13.
//  Copyright (c) 2013 Ian Terrell. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <GLKit/GLKit.h>

@interface EESpriteAnimation : NSObject {
    float elapsedTime;
    NSArray *frames;
    float timePerFrame;
}
-(id)initWithTimePerFrame:(float)timePerFrame framesNamed:(NSArray *)frameNames;
-(void)update:(NSTimeInterval)dt;
-(GLKTextureInfo *)currentFrame;
@end
