//
//  DSSpriteAnimation.m
//  DS-OpenGL-Wrapper
//
//  Created by Sam KDSne on 2/28/13.
//  Copyright (c) 2013 Ian Terrell. All rights reserved.
//

#import "DSSpriteAnimation.h"

@implementation DSSpriteAnimation

-(id)initWithTimePerFrame:(float)time framesNamed:(NSArray *)frameNames {
    self = [super init];
    if (self) {
        elapsedTime = 0;
        timePerFrame = time;
        frames = [NSMutableArray arrayWithCapacity:[frameNames count]];
        for (NSString *name in frameNames)
            [(NSMutableArray*)frames addObject:
             [GLKTextureLoader textureWithCGImage:[UIImage imageNamed:name].CGImage
                                          options:[NSDictionary dictionaryWithObject:[NSNumber numberWithBool:YES] forKey:GLKTextureLoaderOriginBottomLeft]
                                            error:nil]];
    }
    return self;
}

-(void)update:(NSTimeInterval)dt {
    elapsedTime += dt;
}

-(GLKTextureInfo *)currentFrame {
    return [frames objectAtIndex:((int)(elapsedTime/timePerFrame))%[frames count]];
}

@end
