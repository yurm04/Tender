//
//  MyScene.m
//  Tender
//
//  Created by Yuraima Estevez on 4/29/14.
//  Copyright (c) 2014 Yuraima Estevez. All rights reserved.
//

#import "StartScene.h"

@implementation StartScene

-(id)initWithSize:(CGSize)size {    
    if (self = [super initWithSize:size]) {
        /* Setup your scene here */
        
        // Setting background color
        self.backgroundColor = [SKColor colorWithRed:138/255.0f green:181/255.0f blue:189/255.0f alpha:1.0];
        
        // Title Label
        SKLabelNode *titleNode =[SKLabelNode labelNodeWithFontNamed:@"Half Bold Pixel-7"];
        titleNode.text = @"Tender";
        titleNode.fontSize = 40;
        titleNode.position = CGPointMake(CGRectGetMidX(self.frame), CGRectGetMidY(self.frame));
        titleNode.name = @"titleNode";
        
        // Start Label
        SKLabelNode *startNode = [SKLabelNode labelNodeWithFontNamed:@"Half Bold Pixel-7"];
        startNode.text = @"Touch to Start";
        startNode.fontSize = 18;
        startNode.position = CGPointMake(CGRectGetMidX(self.frame), CGRectGetMidY(self.frame) - 30);        // Just below title
        startNode.name = @"startNode";                                                                      // name for identifying node
        
        // Blinking effect for startNode
        SKAction *blink = [SKAction sequence:@[[SKAction fadeOutWithDuration:0.5],
                                               [SKAction fadeInWithDuration:0.5]]];
        [startNode runAction:[SKAction repeatActionForever:blink]];
        
        SKLabelNode *helpNode = [SKLabelNode labelNodeWithFontNamed:@"Half Bold Pixel-7"];
        helpNode.text = @"Help me out!";
        helpNode.fontSize = 18;
        helpNode.position = CGPointMake(75, 15);
        helpNode.name = @"helpNode";
        
        [self addChild:titleNode];
        [self addChild:startNode];
        [self addChild:helpNode];
        
    }
    return self;
}

- (void)didMoveToView:(SKView *)view {
    
    UITapGestureRecognizer *tapRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleTap:)];
    [[self view] addGestureRecognizer:tapRecognizer];
}

- (void) handleTap: (UITapGestureRecognizer *) recognizer {
    
    if (recognizer.state == UIGestureRecognizerStateEnded)
    {
        // Adding gesture recognizer to node at touch point
        CGPoint touchLocation = [recognizer locationInView:recognizer.view];
        touchLocation = [self convertPointFromView:touchLocation];
        
        if ((touchLocation.x >= 0 && touchLocation.x <= 100) && (touchLocation.y >= 0 && touchLocation.y <= 30)) {
            [self help];
        } else {
            [self startGame];
        }
    }
}

- (void) help {
    SKScene *helpScene = [[HelpScene alloc]initWithSize:self.size];
    
    SKTransition *slideUp = [SKTransition moveInWithDirection:SKTransitionDirectionUp duration:1];
    
    [self.view presentScene:helpScene transition:slideUp];
}

- (void) startGame {
    SKScene *barScene = [[BarScene alloc]initWithSize:self.size];
    
    SKTransition *doorway = [SKTransition doorwayWithDuration:1];
    
    [self.view presentScene:barScene transition:doorway];
}

- (void)update:(CFTimeInterval)currentTime {
    /* Called before each frame is rendered */
}

@end
