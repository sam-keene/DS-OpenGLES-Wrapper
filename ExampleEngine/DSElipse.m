//
//  DSElipse.m
//  ExamplDSngine
//
//  Created by Sam KDSne on 2/26/13.
//  Copyright (c) 2013 Ian Terrell. All rights reserved.
//

#import "DSElipse.h"

#define DS_ELLIPSE_RESOLUTION 64
#define M_TAU (2*M_PI)

@implementation DSElipse

-(int)numVertices {
    return DS_ELLIPSE_RESOLUTION;
}

-(void)updateVertices {
    for (int i = 0; i < DS_ELLIPSE_RESOLUTION; i++){
        float theta = ((float)i) / DS_ELLIPSE_RESOLUTION * M_TAU;
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
