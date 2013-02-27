//
//  EEShape.m
//  ExampleEngine
//
//  Created by Sam Keene on 2/26/13.
//  Copyright (c) 2013 Ian Terrell. All rights reserved.
//

#import "EEShape.h"

@implementation EEShape
@synthesize color;
-(int)numVertices {
    return 0;
}

- (GLKVector2 *)vertices {
    if (vertexData == nil)
        vertexData = [NSMutableData dataWithLength:sizeof(GLKVector2)*self.numVertices];
    return [vertexData mutableBytes];
}

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
    effect.useConstantColor = YES;
    effect.constantColor = color;
    [effect prepareToDraw];
    
    [self render];
}
@end
