//
//  FrameAnimationScene.m
//  DS-OpenGL-Wrapper
//
//  Created by Sam Keene on 2/28/13.
//  Copyright (c) 2013 Ian Terrell. All rights reserved.
//

#import "FrameAnimationScene.h"
#import "EESprite.h"

@implementation FrameAnimationScene

-(id)init {
    self = [super init];
    if (self) {
        EESprite *sprite = [[EESprite alloc] initWithImage:[UIImage imageNamed:@"alfred0.png"] pointRatio:100];
        NSArray *frameNames = [NSArray arrayWithObjects:@"alfred1.png", @"alfred2.png", @"alfred3.png", @"alfred4.png", @"alfred5.png", @"alfred6.png", @"alfred7.png", @"alfred8.png", @"alfred9.png", nil];
        sprite.spriteAnimation = [[EESpriteAnimation alloc] initWithTimePerFrame:1.0/9 framesNamed:frameNames];
        
        [self.shapes addObject:sprite];
    }
    return self;
}

@end
