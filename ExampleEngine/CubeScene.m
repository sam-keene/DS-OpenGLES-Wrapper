//
//  CubeScene.m
//  DS-OpenGL-Wrapper
//
//  Created by Sam Keene on 3/1/13.
//  Copyright (c) 2013 Ian Terrell. All rights reserved.
//

#import "CubeScene.h"
#import "DSCube.h"
#import "Constants.h"

@implementation CubeScene
-(id)init {
    self = [super init];
    if (self) {
      
        /*
         DSRectangle *rectangle = [[DSRectangle alloc] init];
         rectangle.position = GLKVector2Make(-1, -1);
         rectangle.width = 2;
         rectangle.height = 1;
         rectangle.scale = GLKVector2Make(0.5, 1);
         rectangle.color = GLKVector4Make(1, 0, 0, .5);
                  
         [self.shapes addObject:rectangle];
         */
        /*
        DSCube *cube = [[DSCube alloc] init];
        cube.width = 2;
        cube.height = 1;
        
        [cube animateWithDuration:5 animations:^() {
            cube.position = GLKVector3Make(1.5,0, 1.5);
            //cube.scale = GLKVector2Make(1, -0.5);
            cube.rotation = 4.0*M_TAU;
            // cube.color = GLKVector4Make(0, 0, 0, 1);
        }];
        
        //cube.position = GLKVector2Make(-1, -1);
        // cube.width = 2;
        //cube.height = 1;
        // cube.scale = GLKVector2Make(0.5, 1);
        //cube.color = GLKVector4Make(1, 0, 0, .5);
        
        [self.shapes addObject:cube];
         */
        
        DSShape3D *shape3D = [[DSShape3D alloc]init];
        [shape3D setTextureImage:[UIImage imageNamed:@"tile_floor.png"]];
        [self.shapes addObject:shape3D];
    }
    return self;
}


@end
