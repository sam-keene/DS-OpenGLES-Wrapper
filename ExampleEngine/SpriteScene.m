//
//  SpriteScene.m
//  DS-OpenGL-Wrapper
//
//  Created by Sam KDSne on 2/27/13.
//  Copyright (c) 2013 Ian Terrell. All rights reserved.
//

#import "SpriteScene.h"
#import "Constants.h"

@implementation SpriteScene
-(id)init
{
    self = [super init];
    if (self) {
        sprite = [[DSSprite alloc] initWithImage:[UIImage imageNamed:@"boy-sprite.png"] pointRatio:100];
        sprite.position = GLKVector2Make(2,-1);
        sprite.rotation = 0.25*M_TAU;
        sprite.scale = GLKVector2Make(0.5, 1.5);
    }
    return self;
}

-(void)render
{
    [super render];
    [sprite renderInScene:self];
}
@end
