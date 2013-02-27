//
//  RectangleScene.m
//  ExampleEngine
//
//  Created by Sam Keene on 2/26/13.
//  Copyright (c) 2013 Ian Terrell. All rights reserved.
//

#import "RectangleScene.h"

@implementation RectangleScene

-(id)init {
    self = [super init];
    if (self) {
        rectangle = [[EERectangle alloc] init];
        rectangle.width = 2;
        rectangle.height = 1;
    }
    return self;
}

-(void)render {
    [super render];
    [rectangle renderInScene:self];
}

@end
