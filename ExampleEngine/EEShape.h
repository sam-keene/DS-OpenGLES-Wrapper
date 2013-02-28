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
    GLKVector2 velocity;
    GLKVector2 acceleration;
    GLKBaseEffect *effect;
    EEShape *parent;
    NSMutableArray *children;
    NSMutableArray *animations;
    float rotation;
    float angularVelocity, angularAcceleration; //for rotation
    BOOL useConstantColor;
}

@property float rotation;
@property float angularVelocity, angularAcceleration;
@property BOOL useConstantColor;
@property(readonly) int numVertices;
@property(readonly) GLKMatrix4 modelviewMatrix;
@property(readonly) GLKVector2 *vertices;
@property(readonly) GLKVector4 *vertexColors;
@property(readonly) GLKVector2 *textureCoordinates;
@property GLKVector2 scale;
@property GLKVector4 color;
@property GLKVector2 position;
@property GLKVector2 velocity;
@property GLKVector2 acceleration;
@property(strong, readonly) NSMutableArray *children;
@property(strong) EEShape *parent;
@property(strong,readonly) GLKTextureInfo *texture;
@property(strong) GLKBaseEffect *effect;
@property(strong, readonly) NSMutableArray *animations;

-(void)renderInScene:(EEScene *)scene;
-(void)setTextureImage:(UIImage *)image;
-(void)addChild:(EEShape *)child;
-(void)update:(NSTimeInterval)dt;
-(void)animateWithDuration:(NSTimeInterval)duration animations:(void (^)(void))animationsBlock;

@end
