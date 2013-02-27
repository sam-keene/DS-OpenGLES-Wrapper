//
//  EEShape.m
//  ExampleEngine
//
//  Created by Sam Keene on 2/26/13.
//  Copyright (c) 2013 Ian Terrell. All rights reserved.
//

#import "EEShape.h"

@implementation EEShape
@synthesize color, useConstantColor;

-(int)numVertices {
    return 0;
}

- (GLKVector2 *)vertices {
    if (vertexData == nil)
        vertexData = [NSMutableData dataWithLength:sizeof(GLKVector2)*self.numVertices];
    return [vertexData mutableBytes];
}

-(void)renderInScene:(EEScene *)scene
{
    //we shouldn't be creating this every render update
    GLKBaseEffect *effect = [[GLKBaseEffect alloc] init];
    
    //use constant color, or "Flat, solid color"
    if (useConstantColor) {
        effect.useConstantColor = YES;
        effect.constantColor = color;
    }
    
    //configure GLKBaseEffect to handle the texture if there is one
    if (texture != nil) {
        effect.texture2d0.envMode = GLKTextureEnvModeReplace;
        effect.texture2d0.target = GLKTextureTarget2D;
        effect.texture2d0.name = texture.name;
    }
    
    //enable the texture data and send it to GL in the same ways as for colors and positions
    if (texture != nil) {
        glEnableVertexAttribArray(GLKVertexAttribTexCoord0);
        glVertexAttribPointer(GLKVertexAttribTexCoord0, 2, GL_FLOAT, GL_FALSE, 0, self.textureCoordinates);
    }
    
    effect.transform.projectionMatrix = scene.projectionMatrix;
    [effect prepareToDraw];
    
    //GL rendery stuff
    glEnableVertexAttribArray(GLKVertexAttribPosition);
    glVertexAttribPointer(GLKVertexAttribPosition, 2, GL_FLOAT, GL_FALSE, 0, self.vertices);
    
    //use vertex color, so GL interpollates colors as gradients between verticies
    if (!useConstantColor) {
        glEnableVertexAttribArray(GLKVertexAttribColor);
        glVertexAttribPointer(GLKVertexAttribColor, 4, GL_FLOAT, GL_FALSE, 0, self.vertexColors);
    }
    
    
    glDrawArrays(GL_TRIANGLE_FAN, 0, self.numVertices);
    
    glDisableVertexAttribArray(GLKVertexAttribPosition);
    
    //need to disable at the end of the render
    if (!useConstantColor)
        glDisableVertexAttribArray(GLKVertexAttribColor);
    
    if (texture != nil)
        glDisableVertexAttribArray(GLKVertexAttribTexCoord0);
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
-(void)setTextureImage:(UIImage *)image {
    NSError *error;
    
    //GLKit flips the image on load, so its 0,0 corrdinate point lines up with UIKit, add this dic to stop it from flipping
    NSDictionary *optionsDic = [NSDictionary dictionaryWithObject:[NSNumber numberWithBool:YES] forKey:GLKTextureLoaderOriginBottomLeft];
    
    //loads the texture, 2nd param flips the image to be more consistent with UiKit 0,0 point
    texture = [GLKTextureLoader textureWithCGImage:image.CGImage options:optionsDic error:&error];
    if (error) {
        NSLog(@"Error loading texture from image: %@",error);
    }
}

/*
 This defines where and how the texture is placed on the shape. OpenGL uses a normalized coordinate system for texture coordinates, with an origin in the lower left of an image. And instead of using x and y, since those are already used for position data, the convention is to refer to the coordinates as s and t.
 The word “normalized” means that the coordinate system only goes from 0 to 1; the right side of the texture image is at s=1, and the top is at t=1.
 
    GL 0,0 is bottom left
 */
- (GLKVector2 *)textureCoordinates {
    if (textureCoordinateData == nil)
        textureCoordinateData = [NSMutableData dataWithLength:sizeof(GLKVector2)*self.numVertices];
    return [textureCoordinateData mutableBytes];
}

@end
