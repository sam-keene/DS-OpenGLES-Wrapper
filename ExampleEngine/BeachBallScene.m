//
//  BeachBallScene.m
//  DS-OpenGL-Wrapper
//
//  Created by Sam Keene on 2/27/13.
//  Copyright (c) 2013 Ian Terrell. All rights reserved.
//

#import "BeachBallScene.h"
#import "Constants.h"

@implementation BeachBallScene

-(id)init
{
    self = [super init];
    if (self) {
        ellipse = [[DSElipse alloc] init];
        ellipse.radiusX = 1;
        ellipse.radiusY = 1;
        
        [ellipse setTextureImage:[UIImage imageNamed:@"ball.jpg"]];
        float textureBallRadius = 0.5;
        float textureCenterOffset = 0.5;
        for (int i = 0; i < ellipse.numVertices; i++){
            float theta = ((float)i) / ellipse.numVertices * M_TAU;
            ellipse.textureCoordinates[i] = GLKVector2Make(textureCenterOffset+cos(theta)*textureBallRadius, textureCenterOffset+sin(theta)*textureBallRadius);
        }
    }
    return self;
}

-(void)render {
    [super render];
    [ellipse renderInScene:self];
}
@end
