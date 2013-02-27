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

/*
-(void)render
{
    glEnableVertexAttribArray(GLKVertexAttribPosition);
    glVertexAttribPointer(GLKVertexAttribPosition, 2, GL_FLOAT, GL_FALSE, 0, self.vertices);
    glDrawArrays(GL_TRIANGLE_FAN, 0, self.numVertices);
    glDisableVertexAttribArray(GLKVertexAttribPosition);
}

-(void)renderInScene:(EEScene *)scene
{
    GLKBaseEffect *effect = [[GLKBaseEffect alloc] init];
    effect.transform.projectionMatrix = scene.projectionMatrix;
    
    //color
    effect.useConstantColor = YES;
    effect.constantColor = color;
    
    [effect prepareToDraw];
    
    [self render];
}
*/

-(void)renderInScene:(EEScene *)scene
{
    GLKBaseEffect *effect = [[GLKBaseEffect alloc] init];
    
    //use constant color, or "Flat, solid color"
    if (useConstantColor) {
        effect.useConstantColor = YES;
        effect.constantColor = color;
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
    
    if (!useConstantColor)
        glDisableVertexAttribArray(GLKVertexAttribColor);
}

//we can store color data individually on each vertex and GL will extrapolate the colors inbetween
- (GLKVector4 *)vertexColors
{
    if (vertexColorData == nil)
        vertexColorData = [NSMutableData dataWithLength:sizeof(GLKVector4)*self.numVertices];
    return [vertexColorData mutableBytes];
}

@end
