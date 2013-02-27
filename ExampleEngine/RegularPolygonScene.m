//
//  RegularPolygonScene.m
//  ExampleEngine
//
//  Created by Sam Keene on 2/26/13.
//  Copyright (c) 2013 Ian Terrell. All rights reserved.
//

#import "RegularPolygonScene.h"

@implementation RegularPolygonScene
-(id)init {
    self = [super init];
    if (self) {
        polygon = [[EERegularPolygon alloc] initWithNumSides:6];
        polygon.radius = 1;
        polygon.color = GLKVector4Make(0.9, 0.9, 0.1, 1.0);
    }
    return self;
}

-(void)update
{
    //[polygon randomUpdateVerts];
}

-(void)render
{
    [super render];
    [polygon renderInScene:self];
}
@end
