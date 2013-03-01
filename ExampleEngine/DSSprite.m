//
//  DSSprite.m
//  DS-OpenGL-Wrapper
//
//  Created by Sam KDSne on 2/27/13.
//  Copyright (c) 2013 Ian Terrell. All rights reserved.
//

#import "DSSprite.h"

@implementation DSSprite
-(id)initWithImage:(UIImage*)image pointRatio:(float)ratio {
    self = [super init];
    if (self) {
        //The width and height are calculated based on the image’s size and scaled by a ratio parameter (i.e. N pixels represent 1 unit in our world coordinates).
        self.width = image.size.width/ratio;
        self.height = image.size.height/ratio;
        
        [self setTextureImage:image];
        self.textureCoordinates[0] = GLKVector2Make(1,0);
        self.textureCoordinates[1] = GLKVector2Make(1,1);
        self.textureCoordinates[2] = GLKVector2Make(0,1);
        self.textureCoordinates[3] = GLKVector2Make(0,0);
    }
    return self;
}
@end
