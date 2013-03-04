//
//  DSShape3D.m
//  DS-OpenGL-Wrapper
//
//  Created by Sam Keene on 3/1/13.
//  Copyright (c) 2013 Ian Terrell. All rights reserved.
//

#import "DSShape3D.h"
#import "DSAnimation.h"



@interface DSShape3D ()
{
   
    float _rotation;
}

@end

@implementation DSShape3D
@synthesize color, useConstantColor, position, rotation, scale, parent, children, texture, velocity, acceleration, angularVelocity, angularAcceleration, animations, spriteAnimation, vertexArray, vertexBuffer, indexBuffer;

//set the defaults
-(id)init
{
    self = [super init];
    if (self) {
        
        
        [self setup3DShape];
    }
    return self;
}

- (GLKVector3 *)vertices
{
    if (vertexData == nil)
        vertexData = [NSMutableData dataWithLength:sizeof(GLKVector3)*self.numVertices];
    return [vertexData mutableBytes];
}

-(void)renderInScene:(DSScene *)scene
{
    /*
    [self.effect prepareToDraw];
    
    glBindVertexArrayOES(self.vertexArray);
    glDrawElements(GL_TRIANGLES, sizeof(Indices)/sizeof(Indices[0]), GL_UNSIGNED_BYTE, 0);
    //glDrawElements(GL_TRIANGLES, (sizeof(self.vertices3D)/sizeof(GLubyte)), GL_UNSIGNED_BYTE, 0);
     */
}

//we can store color data individually on each vertex and GL will extrapolate the colors inbetween
- (GLKVector4 *)vertexColors
{
    if (vertexColorData == nil)
        vertexColorData = [NSMutableData dataWithLength:sizeof(GLKVector4)*self.numVertices];
    return [vertexColorData mutableBytes];
}



//threee steps to using textures:
//  1 Loading the texture.
//  2 Configuring the GLKBaseEffect, in renderInScene:
//  3 Sending texture coordinates to OpenGL.

//  LOAD THE TEXTURE using GLKTextureLoader
-(void)setTextureImage:(UIImage *)image
{
     NSDictionary * options = [NSDictionary dictionaryWithObjectsAndKeys:
     [NSNumber numberWithBool:YES],
     GLKTextureLoaderOriginBottomLeft,
     nil];
     
     NSError * error;
    GLKTextureInfo * info = [GLKTextureLoader textureWithCGImage:image.CGImage options:options error:&error];
     if (info == nil) {
     NSLog(@"Error loading file: %@", [error localizedDescription]);
     }
     self.effect.texture2d0.name = info.name;
     self.effect.texture2d0.enabled = true;
}

/*
 This defines where and how the texture is placed on the shape. OpenGL uses a normalized coordinate system for texture coordinates, with an origin in the lower left of an image. And instead of using x and y, since those are already used for position data, the convention is to refer to the coordinates as s and t.
 The word “normalized” means that the coordinate system only goes from 0 to 1; the right side of the texture image is at s=1, and the top is at t=1.
 
 GL 0,0 is bottom left
 */
- (GLKVector2 *)textureCoordinates
{
    if (textureCoordinateData == nil)
        textureCoordinateData = [NSMutableData dataWithLength:sizeof(GLKVector2)*self.numVertices];
    return [textureCoordinateData mutableBytes];
}

/*
 - model view matrix is used to display multiple shapes in the same context, by recursing up through our parents, and multiplying our matrix by theirs.
 - note that 4x4 matrix multiplication is an expensive operation, should cache this result and only update when it has changed
 
 - set positional data for the "world space", as opposed to object space
 - we can only have one modelview matrix per object, so use GLKMatrix4Multiply to combine into a single matrix.
 - these happen in order, so changing their order will change the outcome
 effect.transform.modelviewMatrix = GLKMatrix4MakeTranslation(position.x, position.y, 0);
 */
-(GLKMatrix4)modelviewMatrix
{
    GLKMatrix4 modelviewMatrix = GLKMatrix4Multiply(GLKMatrix4MakeTranslation(position.x, position.y, position.z),
                                                    GLKMatrix4MakeRotation(rotation, rotation, 0, 1));
    modelviewMatrix = GLKMatrix4Multiply(modelviewMatrix, GLKMatrix4MakeScale(scale.x, scale.y, 1));
    
    if (self.parent != nil)
        modelviewMatrix = GLKMatrix4Multiply(self.parent.modelviewMatrix, modelviewMatrix);
    
    return modelviewMatrix;
    
}
/*
 add child adds the shape with it's vertex arrays to this array so we can cycle through it
 */
-(void)addChild:(DSShape3D *)child
{
    child.parent = self;
    [children addObject:child];
}

-(void)update:(NSTimeInterval)dt
{
    //float aspect = fabsf(self.view.bounds.size.width / self.view.bounds.size.height);
    float aspect = fabsf(4/3);
    //projectionMatrix: The matrix used to transform position coordinates from eye space to projection space.
    GLKMatrix4 projectionMatrix = GLKMatrix4MakePerspective(GLKMathDegreesToRadians(65.0f), aspect, 4.0f, 10.0f);
    self.effect.transform.projectionMatrix = projectionMatrix;
    
    //modelViewMatrix: The matrix used to transform position coordinates from world space to eye space.
    GLKMatrix4 modelViewMatrix = GLKMatrix4MakeTranslation(0.0f, 0.0f, -6.0f);
    _rotation += .90;// * self.timeSinceLastUpdate;
    modelViewMatrix = GLKMatrix4Rotate(modelViewMatrix, GLKMathDegreesToRadians(25), 1, 0, 0);
    modelViewMatrix = GLKMatrix4Rotate(modelViewMatrix, GLKMathDegreesToRadians(_rotation), 0, 1, 0);
    self.effect.transform.modelviewMatrix = modelViewMatrix;
}

// FACTORY METHOD THAT STEALS SOME INSPIRATION FROM UIVIEW's ANIMATION METHODS
-(void)animateWithDuration:(NSTimeInterval)duration animations:(void (^)(void))animationsBlock
{
    //the current values of our animatable attributes
    GLKVector3 currentPosition = self.position;
    GLKVector2 currentScale = self.scale;
    GLKVector4 currentColor = self.color;
    float currentRotation = self.rotation;
    
    //calls the block which will update our attributes
    animationsBlock();
    
    //create animation with deltas based on the difference between the desired values and the current values of our attributes.
    DSAnimation *animation = [[DSAnimation alloc] init];
    animation.positionDelta3D = GLKVector3Subtract(self.position, currentPosition);
    animation.scaleDelta = GLKVector2Subtract(self.scale, currentScale);
    animation.rotationDelta = self.rotation - currentRotation;
    animation.colorDelta = GLKVector4Subtract(self.color, currentColor);
    animation.duration = duration;
    [self.animations addObject:animation];
    
    //reset our attributes to what they were before the block; we’re animating to them, after all, not setting them immediately.
    self.position = currentPosition;
    self.scale = currentScale;
    self.color = currentColor;
    self.rotation = currentRotation;
}


- (GLKVector3 *)vertices3D
{
    if (vertexData == nil)
        vertexData = [NSMutableData dataWithLength:sizeof(GLKVector3)*self.numVertices];
    return [vertexData mutableBytes];
}


////   *************        NEW ABSTRACTED CODE FOR 3D      *************

- (void)setup3DShape
{
    /*
    NSLog(@"***** setUp3DShape");
    self.effect = [[GLKBaseEffect alloc] init];
    
    // generate vertex arrays
    glGenVertexArraysOES(1, &_vertexArray);
    glBindVertexArrayOES(_vertexArray);
    
    // generate vertex buffers
    glGenBuffers(1, &_vertexBuffer);
    glBindBuffer(GL_ARRAY_BUFFER, _vertexBuffer);
    glBufferData(GL_ARRAY_BUFFER, sizeof(Vertices), Vertices, GL_STATIC_DRAW); //need to turn this Vertices data into NSMutableData
    
    glGenBuffers(1, &_indexBuffer);
    glBindBuffer(GL_ELEMENT_ARRAY_BUFFER, _indexBuffer);
    glBufferData(GL_ELEMENT_ARRAY_BUFFER, sizeof(Indices), Indices, GL_STATIC_DRAW);
    
    // New lines (were previously in draw)
    glEnableVertexAttribArray(GLKVertexAttribPosition);
    glVertexAttribPointer(GLKVertexAttribPosition, 3, GL_FLOAT, GL_FALSE, sizeof(Vertex), (const GLvoid *) offsetof(Vertex, Position));
    glEnableVertexAttribArray(GLKVertexAttribColor);
    glVertexAttribPointer(GLKVertexAttribColor, 4, GL_FLOAT, GL_FALSE, sizeof(Vertex), (const GLvoid *) offsetof(Vertex, Color));
    glEnableVertexAttribArray(GLKVertexAttribTexCoord0);
    glVertexAttribPointer(GLKVertexAttribTexCoord0, 2, GL_FLOAT, GL_FALSE, sizeof(Vertex), (const GLvoid *) offsetof(Vertex, TexCoord));
    
    // New line
    glBindVertexArrayOES(0);
    */
}

-(int)numVertices
{
    return 24;
}

-(void)updateVertices
{
    // Front
    self.vertices3D[0] = GLKVector3Make( 1.0, -1.0, 1.0);
    self.vertices3D[1] = GLKVector3Make( 1.0,  1.0, 1.0);
    self.vertices3D[2] = GLKVector3Make(-1.0,  1.0, 1.0);
    self.vertices3D[3] = GLKVector3Make(1.0, -1.0, 1.0);
    // Back
    self.vertices3D[4] = GLKVector3Make( 1.0, 1.0, -1.0);
    self.vertices3D[5] = GLKVector3Make( -1.0,  -1.0, -1.0);
    self.vertices3D[6] = GLKVector3Make(1.0,  -1.0, -1.0);
    self.vertices3D[7] = GLKVector3Make(-1.0, 1.0, -1.0);
    // Left
    self.vertices3D[8] = GLKVector3Make( -1.0, -1.0, 1.0);
    self.vertices3D[9] = GLKVector3Make( -1.0,  1.0, 1.0);
    self.vertices3D[10] = GLKVector3Make(-1.0,  1.0, -1.0);
    self.vertices3D[11] = GLKVector3Make(-1.0, -1.0, -1.0);
    // Right
    self.vertices3D[12] = GLKVector3Make( 1.0, -1.0, -1.0);
    self.vertices3D[13] = GLKVector3Make( 1.0,  1.0, -1.0);
    self.vertices3D[14] = GLKVector3Make(1.0,  1.0, 1.0);
    self.vertices3D[15] = GLKVector3Make(1.0, -1.0, 1.0);
    // Top
    self.vertices3D[16] = GLKVector3Make( 1.0, 1.0, 1.0);
    self.vertices3D[17] = GLKVector3Make( 1.0,  1.0, -1.0);
    self.vertices3D[18] = GLKVector3Make(-1.0,  1.0, -1.0);
    self.vertices3D[19] = GLKVector3Make(-1.0, 1.0, 1.0);
    // Bottom
    self.vertices3D[20] = GLKVector3Make( 1.0, -1.0, -1.0);
    self.vertices3D[21] = GLKVector3Make( 1.0,  -1.0, 1.0);
    self.vertices3D[22] = GLKVector3Make(-1.0,  -1.0, 1.0);
    self.vertices3D[23] = GLKVector3Make(-1.0, -1.0, -1.0);
}
@end
