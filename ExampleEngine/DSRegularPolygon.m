//
//  DSRegularPolygon.m
//  ExamplDSngine
//
//  Created by Sam KDSne on 2/26/13.
//  Copyright (c) 2013 Ian Terrell. All rights reserved.
//

#import "DSRegularPolygon.h"

#define M_TAU (2*M_PI)

@implementation DSRegularPolygon

@synthesize numSides;

-(id)initWithNumSides:(int)_numSides
{
    self = [super init];
    if (self) {
        numSides = _numSides;
    }
    return self;
}

-(int)numVertices
{
    return numSides;
}

-(void)updateVertices
{
    for (int i = 0; i < numSides; i++){
        float theta = ((float)i) / numSides * M_TAU;
        self.vertices[i] = GLKVector2Make(cos(theta)*radius, sin(theta)*radius);
    }
}

-(float)radius
{
    return radius;
}

-(void)setRadius:(float)_radius
{
    radius = _radius;
    [self updateVertices];
}

-(void)randomUpdateVerts
{
    for (int i = 0; i < numSides; i++){
        float theta = ((CGFloat)(rand()%100)/10);
        self.vertices[i] = GLKVector2Make(cos(theta)*radius, sin(theta)*radius);
    }
}

@end
