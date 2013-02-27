//
//  EEElipseScene.m
//  ExampleEngine
//
//  Created by Sam Keene on 2/26/13.
//  Copyright (c) 2013 Ian Terrell. All rights reserved.
//

#import "EEElipseScene.h"

@implementation EEElipseScene
-(id)init {
    self = [super init];
    if (self) {
        ellipse = [[EEElipse alloc] init];
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
