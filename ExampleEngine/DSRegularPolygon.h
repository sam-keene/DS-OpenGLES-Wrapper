//
//  EERegularPolygon.h
//  ExampleEngine
//
//  Created by Sam Keene on 2/26/13.
//  Copyright (c) 2013 Ian Terrell. All rights reserved.
//

#import "DSShape.h"

@interface DSRegularPolygon : DSShape {
    int numSides;
    float radius;
}
@property(readonly) int numSides;
@property float radius;
-(id)initWithNumSides:(int)numSides;
-(void)randomUpdateVerts;
@end
