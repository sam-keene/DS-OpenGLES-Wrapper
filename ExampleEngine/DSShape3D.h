//
//  DSShape3D.h
//  DS-OpenGL-Wrapper
//
//  Created by Sam Keene on 3/1/13.
//  Copyright (c) 2013 Ian Terrell. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <GLKit/GLKit.h>
#import "DSScene.h"
#import "DSSpriteAnimation.h"
#import "DSShape.h"

@interface DSShape3D : NSObject
{
    NSMutableData *vertexData;
    NSMutableData *vertexColorData;
    NSMutableData *textureCoordinateData;
    GLKVector4 color;
    GLKTextureInfo *texture;
    GLKVector3 position;
    GLKVector2 scale;
    GLKVector3 velocity;
    GLKVector3 acceleration;
    GLKBaseEffect *effect;
    DSShape3D *parent;
    NSMutableArray *children;
    NSMutableArray *animations;
    DSSpriteAnimation *spriteAnimation;
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
@property(readonly) GLKVector3 *vertices3D;
@property(readonly) GLKVector4 *vertexColors;
@property(readonly) GLKVector2 *textureCoordinates;
@property GLKVector2 scale;
@property GLKVector4 color;
@property GLKVector3 position;
@property GLKVector3 velocity;
@property GLKVector3 acceleration;
@property(strong, readonly) NSMutableArray *children;
@property(strong) DSShape3D *parent;
@property(strong,readonly) GLKTextureInfo *texture;
@property(strong) GLKBaseEffect *effect;
@property(strong, readonly) NSMutableArray *animations;
@property(strong) DSSpriteAnimation *spriteAnimation;

-(void)renderInScene:(DSScene *)scene;
-(void)setTextureImage:(UIImage *)image;
-(void)addChild:(DSShape3D *)child;
-(void)update:(NSTimeInterval)dt;
-(void)animateWithDuration:(NSTimeInterval)duration animations:(void (^)(void))animationsBlock;

@end
