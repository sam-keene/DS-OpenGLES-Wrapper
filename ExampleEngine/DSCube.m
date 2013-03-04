//
//  DSCube.m
//  DS-OpenGL-Wrapper
//
//  Created by Sam Keene on 3/1/13.
//  Copyright (c) 2013 Ian Terrell. All rights reserved.
//

#import "DSCube.h"

typedef struct {
    float Position[3];
    float Color[4];
    float TexCoord[2];
} Vertex;

// TODO convert these to NSMutableData..... maybe
const Vertex Vertices[] = {
    // Front
    {{1, -1, 1}, {1, 0, 0, 1}, {1, 0}},
    {{1, 1, 1}, {0, 1, 0, 1}, {1, 1}},
    {{-1, 1, 1}, {0, 0, 1, 1}, {0, 1}},
    {{-1, -1, 1}, {0, 0, 0, 1}, {0, 0}},
    // Back
    {{1, 1, -1}, {1, 0, 0, 1}, {0, 1}},
    {{-1, -1, -1}, {0, 1, 0, 1}, {1, 0}},
    {{1, -1, -1}, {0, 0, 1, 1}, {0, 0}},
    {{-1, 1, -1}, {0, 0, 0, 1}, {1, 1}},
    // Left
    {{-1, -1, 1}, {1, 0, 0, 1}, {1, 0}},
    {{-1, 1, 1}, {0, 1, 0, 1}, {1, 1}},
    {{-1, 1, -1}, {0, 0, 1, 1}, {0, 1}},
    {{-1, -1, -1}, {0, 0, 0, 1}, {0, 0}},
    // Right
    {{1, -1, -1}, {1, 0, 0, 1}, {1, 0}},
    {{1, 1, -1}, {0, 1, 0, 1}, {1, 1}},
    {{1, 1, 1}, {0, 0, 1, 1}, {0, 1}},
    {{1, -1, 1}, {0, 0, 0, 1}, {0, 0}},
    // Top
    {{1, 1, 1}, {1, 0, 0, 1}, {1, 0}},
    {{1, 1, -1}, {0, 1, 0, 1}, {1, 1}},
    {{-1, 1, -1}, {0, 0, 1, 1}, {0, 1}},
    {{-1, 1, 1}, {0, 0, 0, 1}, {0, 0}},
    // Bottom
    {{1, -1, -1}, {1, 0, 0, 1}, {1, 0}},
    {{1, -1, 1}, {0, 1, 0, 1}, {1, 1}},
    {{-1, -1, 1}, {0, 0, 1, 1}, {0, 1}},
    {{-1, -1, -1}, {0, 0, 0, 1}, {0, 0}}
};


const GLubyte Indices[] = {
    // Front
    0, 1, 2,
    2, 3, 0,
    // Back
    4, 6, 5,
    4, 5, 7,
    // Left
    8, 9, 10,
    10, 11, 8,
    // Right
    12, 13, 14,
    14, 15, 12,
    // Top
    16, 17, 18,
    18, 19, 16,
    // Bottom
    20, 21, 22,
    22, 23, 20
};
@implementation DSCube
@synthesize vertices;

-(int)numVertices
{
    return 24;
}

/*
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
*/
-(float)width
{
    return width;
}

-(void)setWidth:(float)_width
{
    width = _width;
    //[self updateVertices];
}

-(float)height
{
    return height;
}

-(void)setHeight:(float)_height
{
    height = _height;
    //[self updateVertices];
}


- (void)setup3DShape
{
    
    NSLog(@"***** setUp3DShape");
    self.effect = [[GLKBaseEffect alloc] init];
    
    // generate vertex arrays
    glGenVertexArraysOES(1, &vertexArray);
    glBindVertexArrayOES(vertexArray);
    
    // generate vertex buffers
    glGenBuffers(1, &vertexBuffer);
    glBindBuffer(GL_ARRAY_BUFFER, vertexBuffer);
    glBufferData(GL_ARRAY_BUFFER, sizeof(Vertices), Vertices, GL_STATIC_DRAW); //need to turn this Vertices data into NSMutableData
    
    glGenBuffers(1, &indexBuffer);
    glBindBuffer(GL_ELEMENT_ARRAY_BUFFER, indexBuffer);
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
    
}

-(void)renderInScene:(DSScene *)scene
{
    [self.effect prepareToDraw];
     
     glBindVertexArrayOES(self.vertexArray);
     glDrawElements(GL_TRIANGLES, sizeof(Indices)/sizeof(Indices[0]), GL_UNSIGNED_BYTE, 0);
    
}
@end
