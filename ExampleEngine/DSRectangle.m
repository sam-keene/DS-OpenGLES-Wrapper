//
//  DSRectangle.m
//  
//
//  Created by Sam Keene on 2/26/13.
//  Copyright (c) 2013 Ian Terrell. All rights reserved.
//

#import "DSRectangle.h"

@implementation DSRectangle

-(int)numVertices {
    return 4;
}

-(void)updateVertices {
    self.vertices[0] = GLKVector2Make( width/2.0, -height/2.0);
    self.vertices[1] = GLKVector2Make( width/2.0,  height/2.0);
    self.vertices[2] = GLKVector2Make(-width/2.0,  height/2.0);
    self.vertices[3] = GLKVector2Make(-width/2.0, -height/2.0);
}

-(float)width {
    return width;
}

-(void)setWidth:(float)_width {
    width = _width;
    [self updateVertices];
}

-(float)height {
    return height;
}

-(void)setHeight:(float)_height {
    height = _height;
    [self updateVertices];
}

@end
