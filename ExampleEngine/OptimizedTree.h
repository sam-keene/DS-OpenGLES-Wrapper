//
//  OptimizedTree.h
//  DS-OpenGL-Wrapper
//
//  Created by Sam Keene on 2/28/13.
//  Copyright (c) 2013 Ian Terrell. All rights reserved.
//


#import "DSShape.h"
#import "DSRectangle.h"
#import "DSTriangle.h"

/*
 IN THIS CLASS WE USE THE same vertex data for their leaves and trunks. 
 One approach to do this is to use prototype objects that are the sole 
 source of vertex data (and in the general case, color and texture data as well). 
 In this approach, an OptimizedShape will delegate all of its 
 relevant methods (currently numVertices, vertices, color, vertexColors, texture, and textureCoordinates)
 to the prototype object.
 
 */
@interface OptimizedShape : DSShape  {
    DSShape *prototype;
}
@end

@interface OptimizedTrunk : OptimizedShape
@end

@interface OptimizedLeaves : OptimizedShape
@end

@interface OptimizedTree : DSShape
@end
