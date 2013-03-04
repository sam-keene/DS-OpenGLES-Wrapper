//
//  EESceneController.m
//  ExampleEngine
//
//  Created by Sam Keene on 2/26/13.
//  Copyright (c) 2013 Ian Terrell. All rights reserved.
//

#import "DSSceneController.h"
#import "CubeScene.h"


@interface DSSceneController ()

//@property (strong, nonatomic) GLKBaseEffect *effect;

@end

@implementation DSSceneController
@synthesize context = _context;
//@synthesize effect = _effect;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        NSLog(@"DSSceneController initWithNibName");
    }
    return self;
}

- (void)viewDidLoad
{
    NSLog(@"DSSceneController viewDidLoad");
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    [super viewDidLoad];
    self.preferredFramesPerSecond = 60;
    
    self.context = [[EAGLContext alloc] initWithAPI:kEAGLRenderingAPIOpenGLES2];
    
    
     [EAGLContext setCurrentContext:self.context];
     glEnable(GL_CULL_FACE);
    
    if (!self.context) {
        NSLog(@"Failed to create ES context");
    }
    
    GLKView *view = (GLKView *)self.view;
    view.context = self.context;
    view.drawableMultisample = GLKViewDrawableMultisample4X;
    
    /*
    GLKView *view = (GLKView *)self.view;
    view.context = self.context;
     */
    
    scene = [[CubeScene alloc] init];
    scene.clearColor = GLKVector4Make(0.1, 0.9, 0.9, 0.0);
    scene.left   = -3;
    scene.right  =  3;
    scene.bottom = -2;
    scene.top    =  2;
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    
    if ([EAGLContext currentContext] == self.context) {
        [EAGLContext setCurrentContext:nil];
    }
    self.context = nil;
}

// DSSceneController.m
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation
{
    return UIInterfaceOrientationIsLandscape(toInterfaceOrientation);
}

#pragma mark - GLKViewDelegate

- (void)glkView:(GLKView *)view drawInRect:(CGRect)rect
{
    [scene render];
    
    /*
    glClearColor(_curRed, 0.0, 0.0, 1.0);
    glClear(GL_COLOR_BUFFER_BIT);
    
    [self.effect prepareToDraw];
    
    glBindVertexArrayOES(_vertexArray);
    glDrawElements(GL_TRIANGLES, sizeof(Indices)/sizeof(Indices[0]), GL_UNSIGNED_BYTE, 0);
     */
}

#pragma mark - GLKViewControllerDelegate

- (void)update
{
    [scene update:self.timeSinceLastUpdate];
    
    /*
    float aspect = fabsf(self.view.bounds.size.width / self.view.bounds.size.height);
    //projectionMatrix: The matrix used to transform position coordinates from eye space to projection space.
    GLKMatrix4 projectionMatrix = GLKMatrix4MakePerspective(GLKMathDegreesToRadians(65.0f), aspect, 4.0f, 10.0f);
    self.effect.transform.projectionMatrix = projectionMatrix;
    
    //modelViewMatrix: The matrix used to transform position coordinates from world space to eye space.
    GLKMatrix4 modelViewMatrix = GLKMatrix4MakeTranslation(0.0f, 0.0f, -6.0f);
    _rotation += 90 * self.timeSinceLastUpdate;
    modelViewMatrix = GLKMatrix4Rotate(modelViewMatrix, GLKMathDegreesToRadians(25), 1, 0, 0);
    modelViewMatrix = GLKMatrix4Rotate(modelViewMatrix, GLKMathDegreesToRadians(_rotation), 0, 1, 0);
    self.effect.transform.modelviewMatrix = modelViewMatrix;
    */
}

//pauses the GL Render on tap:
/*
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    self.paused = !self.paused;
}
 */



@end
