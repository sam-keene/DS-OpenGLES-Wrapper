//
//  EEElipse.m
//  ExampleEngine
//
//  Created by Sam Keene on 2/26/13.
//  Copyright (c) 2013 Ian Terrell. All rights reserved.
//

#import "EEElipse.h"

#define EE_ELLIPSE_RESOLUTION 64
#define M_TAU (2*M_PI)

@implementation EEElipse

-(int)numVertices {
    return EE_ELLIPSE_RESOLUTION;
}

-(void)updateVertices {
    for (int i = 0; i < EE_ELLIPSE_RESOLUTION; i++){
        float theta = ((float)i) / EE_ELLIPSE_RESOLUTION * M_TAU;
        self.vertices[i] = GLKVector2Make(cos(theta)*radiusX, sin(theta)*radiusY);
    }
}

-(float)radiusX {
    return radiusX;
}

-(void)setRadiusX:(float)_radiusX {
    radiusX = _radiusX;
    [self updateVertices];
}

-(float)radiusY {
    return radiusY;
}

-(void)setRadiusY:(float)_radiusY {
    radiusY = _radiusY;
    [self updateVertices];
}

@end
