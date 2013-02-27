//
//  EESprite.h
//  DS-OpenGL-Wrapper
//
//  Created by Sam Keene on 2/27/13.
//  Copyright (c) 2013 Ian Terrell. All rights reserved.
//

#import "EERectangle.h"

@interface EESprite : EERectangle
-(id)initWithImage:(UIImage*)image pointRatio:(float)ratio;
@end
