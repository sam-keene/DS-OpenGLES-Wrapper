//
//  EEShape.m
//  ExampleEngine
//
//  Created by Sam Keene on 2/26/13.
//  Copyright (c) 2013 Ian Terrell. All rights reserved.
//

#import "EEShape.h"

@implementation EEShape
@synthesize color, useConstantColor, position, rotation, scale, parent, children, texture, velocity;

//set the defaults
-(id)init {
    self = [super init];
    if (self) {
        //holds the childeren shapes
        children = [[NSMutableArray alloc] init];
        // Draw with the color white
        useConstantColor = YES;
        color = GLKVector4Make(1,1,1,1);
        
        // No texture
        texture = nil;
        
        // Center on the origin
        position = GLKVector2Make(0,0);
        
        // Don't rotate
        rotation = 0;
        
        // Scale to original size
        scale = GLKVector2Make(1,1);
        
        self.effect = [[GLKBaseEffect alloc] init];
    }
    return self;
}

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
    //enable transparency
    //check out this link for more info on GL transparencies:
    //http://www.opengl.org/archives/resources/faq/technical/transparency.htm
    glEnable(GL_BLEND);
    glBlendFunc(GL_SRC_ALPHA, GL_ONE_MINUS_SRC_ALPHA);
    
    //we shouldn't be creating this every render update
    
    
    //use constant color, or "Flat, solid color"
    if (useConstantColor) {
        self.effect.useConstantColor = YES;
        self.effect.constantColor = self.color;
    }
    
    //configure GLKBaseEffect, our texture effect, to handle the texture if there is one
    if (self.texture != nil) {
        self.effect.texture2d0.envMode = GLKTextureEnvModeReplace;
        self.effect.texture2d0.target = GLKTextureTarget2D;
        //effect.texture2d0.name = texture.name;
        self.effect.texture2d0.name = self.texture.name;
    }
    
    //enable the texture data and send it to GL in the same ways as for colors and positions
    //// If we have a texture, tell OpenGL that we'll be using texture coordinate data
    if (self.texture != nil) {
        glEnableVertexAttribArray(GLKVertexAttribTexCoord0);
        glVertexAttribPointer(GLKVertexAttribTexCoord0, 2, GL_FLOAT, GL_FALSE, 0, self.textureCoordinates);
    }
    
    // Set up the projection matrix to fit the scene's boundaries
    self.effect.transform.projectionMatrix = scene.projectionMatrix;
    
    //model view matrix is used to display multiple shapesin the same context...
    self.effect.transform.modelviewMatrix = self.modelviewMatrix;
    
    // Tell OpenGL that we're going to use this effect for our upcoming drawing
    [self.effect prepareToDraw];
    
    // Tell OpenGL that we'll be using vertex position data
    glEnableVertexAttribArray(GLKVertexAttribPosition);
    glVertexAttribPointer(GLKVertexAttribPosition, 2, GL_FLOAT, GL_FALSE, 0, self.vertices);
    
    //use vertex color, so GL interpollates colors as gradients between verticies
    // If we're using vertex coloring, tell OpenGL that we'll be using vertex color data
    if (!useConstantColor) {
        glEnableVertexAttribArray(GLKVertexAttribColor);
        glVertexAttribPointer(GLKVertexAttribColor, 4, GL_FLOAT, GL_FALSE, 0, self.vertexColors);
    }
    
    //// Draw our primitives!, draw the GL arrays for the shape, and use the Fan Style
    glDrawArrays(GL_TRIANGLE_FAN, 0, self.numVertices);
    
    // Cleanup: Done with position data
    glDisableVertexAttribArray(GLKVertexAttribPosition);
    
    // Cleanup: Done with color data (only if we used it)r
    if (!useConstantColor)
        glDisableVertexAttribArray(GLKVertexAttribColor);
    
    // Cleanup: Done with texture data (only if we used it)
    if (self.texture != nil)
        glDisableVertexAttribArray(GLKVertexAttribTexCoord0);
    
    //disable glBlend for transparencies
    glDisable(GL_BLEND);
    
    // Draw our children recursively
    [children makeObjectsPerformSelector:@selector(renderInScene:) withObject:scene];
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
    NSLog(@"*** setting texture");
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

/*
 - model view matrix is used to display multiple shapes in the same context, by recursing up through our parents, and multiplying our matrix by theirs.
 - note that 4x4 matrix multiplication is an expensive operation, should cache this result and only update when it has changed
 
 - set positional data for the "world space", as opposed to object space
 - we can only have one modelview matrix per object, so use GLKMatrix4Multiply to combine into a single matrix.
 - these happen in order, so changing their order will change the outcome
  effect.transform.modelviewMatrix = GLKMatrix4MakeTranslation(position.x, position.y, 0);
 */
-(GLKMatrix4)modelviewMatrix {
    GLKMatrix4 modelviewMatrix = GLKMatrix4Multiply(GLKMatrix4MakeTranslation(position.x, position.y, 0),
                                                    GLKMatrix4MakeRotation(rotation, 0, 0, 1));
    modelviewMatrix = GLKMatrix4Multiply(modelviewMatrix, GLKMatrix4MakeScale(scale.x, scale.y, 1));
    
    if (self.parent != nil)
        modelviewMatrix = GLKMatrix4Multiply(self.parent.modelviewMatrix, modelviewMatrix);
    
    return modelviewMatrix;
}
/*
add child adds the shape with it's vertex arrays to this array so we can cycle through it
 */
-(void)addChild:(EEShape *)child {
    child.parent = self;
    [children addObject:child];
}

-(void)update:(NSTimeInterval)dt {
    GLKVector2 distanceTraveled = GLKVector2MultiplyScalar(self.velocity, dt);
    //the next line could be written a lot easier on C++ as position+=velocity*dt
    self.position = GLKVector2Add(self.position, distanceTraveled);
}

@end
