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
    NSMutableData *textureCoordinateData;
    GLKVector4 color;
    GLKTextureInfo *texture;
    GLKVector2 position;
    GLKVector2 scale;
    float rotation;
    BOOL useConstantColor;
}

@property float rotation;
@property BOOL useConstantColor;
@property(readonly) int numVertices;
@property(readonly) GLKVector2 *vertices;
@property(readonly) GLKVector4 *vertexColors;
@property(readonly) GLKVector2 *textureCoordinates;
@property GLKVector2 scale;
@property GLKVector4 color;
@property GLKVector2 position;

-(void)renderInScene:(EEScene *)scene;
-(void)setTextureImage:(UIImage *)image;

@end
