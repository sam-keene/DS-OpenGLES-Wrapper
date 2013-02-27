//
//  SpriteScene.m
//  DS-OpenGL-Wrapper
//
//  Created by Sam Keene on 2/27/13.
//  Copyright (c) 2013 Ian Terrell. All rights reserved.
//

#import "SpriteScene.h"

@implementation SpriteScene
-(id)init
{
    self = [super init];
    if (self) {
        sprite = [[EESprite alloc] initWithImage:[UIImage imageNamed:@"boy-sprite.png"] pointRatio:100];
    }
    return self;
}

-(void)render
{
    [super render];
    [sprite renderInScene:self];
}
@end
