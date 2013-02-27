//
//  TreeScene.h
//  DS-OpenGL-Wrapper
//
//  Created by Sam Keene on 2/27/13.
//  Copyright (c) 2013 Ian Terrell. All rights reserved.
//

#import "EEScene.h"
#import "EETriangle.h"
#import "EERectangle.h"

@interface TreeScene : EEScene {
    EETriangle *leaves;
    EERectangle *trunk;
}

@end
