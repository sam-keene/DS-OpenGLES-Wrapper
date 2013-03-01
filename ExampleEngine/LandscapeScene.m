//
//  LandscapeScene.m
//  DS-OpenGL-Wrapper
//
//  Created by Sam Keene on 2/27/13.
//  Copyright (c) 2013 Ian Terrell. All rights reserved.
//

#import "LandscapeScene.h"

@implementation LandscapeScene

-(id)init {
    self = [super init];
    if (self) {
        rectangle = [[DSRectangle alloc] init];
        rectangle.width = 6;
        rectangle.height = 4;
        
        [rectangle setTextureImage:[UIImage imageNamed:@"landscape.jpg"]];
        /*
        rectangle.textureCoordinates[0] = GLKVector2Make(1,0);
        rectangle.textureCoordinates[1] = GLKVector2Make(1,1);
        rectangle.textureCoordinates[2] = GLKVector2Make(0,1);
        rectangle.textureCoordinates[3] = GLKVector2Make(0,0);
         */
        rectangle.textureCoordinates[0] = GLKVector2Make(1,0);
        rectangle.textureCoordinates[1] = GLKVector2Make(1,0.88);   //.88 fixes the aspect ratio problem with this image, as it isn't 3:2, it's 4:3
        rectangle.textureCoordinates[2] = GLKVector2Make(0,0.88);
        rectangle.textureCoordinates[3] = GLKVector2Make(0,0);
    }
    return self;
}

-(void)render
{
    [super render];
    [rectangle renderInScene:self];
}

@end
