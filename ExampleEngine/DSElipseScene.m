//
//  DSElipseScene.m
//  ExampleEngine
//
//  Created by Sam Keene on 2/26/13.
//  Copyright (c) 2013 Ian Terrell. All rights reserved.
//

#import "DSElipseScene.h"

@implementation DSElipseScene
-(id)init {
    self = [super init];
    if (self) {
        ellipse = [[DSElipse alloc] init];
        ellipse.radiusX = 2;
        ellipse.radiusY = 1;
    }
    return self;
}

-(void)render {
    [super render];
    [ellipse renderInScene:self];
}
@end
