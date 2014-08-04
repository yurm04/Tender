//
//  HelpScene.m
//  Tender
//
//  Created by Yuraima Estevez on 7/4/14.
//  Copyright (c) 2014 Yuraima Estevez. All rights reserved.
//

#import "HelpScene.h"

@implementation HelpScene

- (instancetype)initWithSize:(CGSize)size
{
    self = [super initWithSize:size];
    
    if (self) {
        self.screens = @[@"tut0.png", @"tut1.png", @"tut2.png"];
        self.currentScreen = 0;
        self.background = [[SKSpriteNode alloc]initWithImageNamed:self.screens[self.currentScreen]];
        self.background.userInteractionEnabled = YES;
        self.background.position = CGPointMake(CGRectGetMidX(self.frame), CGRectGetMidY(self.frame));
        [self addChild:self.background];
        
        self.backButton = [[SKLabelNode alloc]initWithFontNamed:@"Half Bold Pixel-7"];
        self.backButton.text = @"Back";
        self.backButton.fontSize = 15;
        self.backButton.position = CGPointMake(25, 10);
        [self addChild: self.backButton];
    }
    
    return self;
}

- (void)didMoveToView:(SKView *)view
{
    UITapGestureRecognizer *tapRecognizer = [[UITapGestureRecognizer alloc]initWithTarget:self
                                                                                   action:@selector(handleTap:)];
    [[self view] addGestureRecognizer:tapRecognizer];
    
    UISwipeGestureRecognizer *left = [[UISwipeGestureRecognizer alloc]initWithTarget:self
                                                                              action:@selector(swipeLeft)];
    left.direction = UISwipeGestureRecognizerDirectionLeft;
    [[self view] addGestureRecognizer:left];
    
    UISwipeGestureRecognizer *right = [[UISwipeGestureRecognizer alloc]initWithTarget:self
                                                                               action:@selector(swipeRight)];
    right.direction = UISwipeGestureRecognizerDirectionRight;
    [self.view addGestureRecognizer:right];
}

- (void)handleTap:(UITapGestureRecognizer *)recognizer
{
    if (recognizer.state == UIGestureRecognizerStateEnded)
    {
        // Adding gesture recognizer to node at touch point
        CGPoint touchLocation = [recognizer locationInView:recognizer.view];
        touchLocation = [self convertPointFromView:touchLocation];
        
        if ((touchLocation.x >= 0 && touchLocation.x <= 200)
            && (touchLocation.y >= 0 && touchLocation.y <= 100)) {
            [self backToMenu];
        }
    }
}

- (void)swipeLeft
{
    NSLog(@"left");
    [self nextScreen];
}

- (void)swipeRight
{
    NSLog(@"right");
    [self previousScreen];
}

- (void)nextScreen
{
    if (self.currentScreen < self.screens.count) {
        self.currentScreen += 1;
        NSLog(@"Screen %i", self.currentScreen);
        self.background.texture = [SKTexture textureWithImageNamed:[NSString stringWithFormat:@"tut%i.png", self.currentScreen]];
    }
}

- (void)previousScreen
{    
    if (self.currentScreen != 0) {
        self.currentScreen -= 1;
        NSLog(@"Screen %i", self.currentScreen);
        self.background.texture = [SKTexture textureWithImageNamed:[NSString stringWithFormat:@"tut%i.png", self.currentScreen]];
    }
}

- (void)backToMenu {
    SKScene *startScene = [[StartScene alloc]initWithSize:self.size];

    SKTransition *slideDown = [SKTransition moveInWithDirection:SKTransitionDirectionDown duration:1];
    
    [self.view presentScene:startScene
                 transition:slideDown];
}


@end
