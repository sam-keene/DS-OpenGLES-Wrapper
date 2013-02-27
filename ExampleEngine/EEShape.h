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
    BOOL useConstantColor;
}

@property BOOL useConstantColor;
@property(readonly) int numVertices;
@property(readonly) GLKVector2 *vertices;
@property(readonly) GLKVector4 *vertexColors;
@property GLKVector4 color;
@property(readonly) GLKVector2 *textureCoordinates;

-(void)renderInScene:(EEScene *)scene;
-(void)setTextureImage:(UIImage *)image;

@end
