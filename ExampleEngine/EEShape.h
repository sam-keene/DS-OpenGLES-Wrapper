//
//  EEShape.h
//  ExampleEngine
//
//  Created by Sam Keene on 2/26/13.
//  Copyright (c) 2013 Ian Terrell. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <GLKit/GLKit.h>
#import "EEScene.h"

@interface EEShape : NSObject
{
    NSMutableData *vertexData;
    NSMutableData *vertexColorData;
    GLKVector4 color;
    BOOL useConstantColor;
}
-(void)render;
@property(readonly) int numVertices;
@property(readonly) GLKVector2 *vertices;
@property(readonly) GLKVector4 *vertexColors;
@property GLKVector4 color;
-(void)renderInScene:(EEScene *)scene;
@property BOOL useConstantColor;

@end
