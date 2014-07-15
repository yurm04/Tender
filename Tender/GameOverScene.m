//
//  GameOverScene.m
//  Tender
//
//  Created by Yuraima Estevez on 5/3/14.
//  Copyright (c) 2014 Yuraima Estevez. All rights reserved.
//

#import "GameOverScene.h"


@implementation GameOverScene
{
    NSInteger gameScore;
}

-(id)initWithSize: (CGSize)size Score:(NSInteger)score
{
    if (self = [super initWithSize:size])
    {
        self.backgroundColor = [SKColor colorWithRed:138/255.0f green:181/255.0f blue:189/255.0f alpha:1.0];
        SKLabelNode *gameOverLabel = [[SKLabelNode alloc]initWithFontNamed:@"Futura-Medium"];
        gameOverLabel.name = @"gameOverLabel";
        gameOverLabel.text = @"Game Over";
        gameOverLabel.fontSize = 50;
        gameOverLabel.position = CGPointMake(CGRectGetMidX(self.frame), CGRectGetMidY(self.frame)+ 50);
        NSLog(@"%f,%f", gameOverLabel.position.x, gameOverLabel.position.y);
        gameOverLabel.fontColor = [SKColor whiteColor];
        
        SKLabelNode *scoreLabel = [[SKLabelNode alloc]initWithFontNamed:@"Futura-Medium"];
        scoreLabel.text = [NSString stringWithFormat:@"$%ld",(long)score];
        scoreLabel.fontSize = 35;
        scoreLabel.position = CGPointMake(284, 90);
        
        self.scoreString = [NSString stringWithFormat:@"%ld",(long)score];
        NSLog(@"%ld", (long)score);
        NSLog(@"%@", self.scoreString);
        
        SKLabelNode *homeButton = [[SKLabelNode alloc]initWithFontNamed:@"Half Bold Pixel-7"];
        homeButton.text = @"Home";
        homeButton.fontSize = 15;
        homeButton.position = CGPointMake(30, 30);
        
        SKLabelNode *newGame = [[SKLabelNode alloc]initWithFontNamed:@"Half Bold Pixel-7"];
        newGame.text = @"New Game";
        newGame.fontSize = 15;
        newGame.position = CGPointMake(500, 30);
        
        [self addChild:gameOverLabel];
        [self addChild:scoreLabel];
        [self addChild:homeButton];
        [self addChild:newGame];
        
        gameScore = score;
        self.dbHandler = [[AppDelegate alloc]init];
    }
    return self;
}

-(void)didMoveToView:(SKView *)view
{
    // UITextField for adding name
    self.nameField = [[UITextField alloc]initWithFrame:CGRectMake(CGRectGetMidX(self.frame), 100, self.view.frame.size.height / 2, self.view.frame.size.width / 2)];
    self.nameField.center = CGPointMake(CGRectGetMidX(self.frame) + 50, CGRectGetMidY(self.frame));
    self.nameField.font = [UIFont fontWithName:@"Futura-Medium" size:40];
    self.nameField.placeholder = @"Add Name";
    //self.nameField.center = self.view.center;
    self.nameField.clearsOnInsertion = YES;
    self.nameField.delegate = self;
    self.nameField.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    
    [self.view addSubview:self.nameField];
    
    UITapGestureRecognizer *tapRecognizer = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(handleTap:)];
    [[self view] addGestureRecognizer:tapRecognizer];
}

- (void) handleTap: (UIGestureRecognizer *) recognizer {
    
    CGPoint touchLocation = [recognizer locationInView:recognizer.view];
    touchLocation = [self convertPointFromView:touchLocation];
    
    if ((touchLocation.x >= 0 && touchLocation.x <= 30) && (touchLocation.y >= 0 && touchLocation.y <= 30)) {
        [self backToMenu];
    } else if ((touchLocation.x >= 450 && touchLocation.x <= 500) && (touchLocation.y >= 0 && touchLocation.y <= 30)) {
        [self newGame];
    }
    
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    
	[textField resignFirstResponder];
    if (self.nameField.text != nil) {
        [self recordScore];
        [self displayHighScore];
    }

	return YES;
}

- (void) recordScore
{
    [self.dbHandler insertName:self.nameField.text Score:self.scoreString];
}

- (void) displayHighScore
{
    NSString *gamerScore = [self.dbHandler getHighScoreWithName:self.nameField.text];
    SKLabelNode *scoreLabel = [[SKLabelNode alloc]initWithFontNamed:@"Futura-Medium"];
    scoreLabel.fontSize = 25;
    scoreLabel.position = CGPointMake(284, 60);
    if (!gameScore) {
        scoreLabel.text = [NSString stringWithFormat:@"No Score to beat yet!"];
    }
    else if (gameScore <= [gamerScore intValue]) {
        scoreLabel.text = [NSString stringWithFormat:@"Your Best Score:  $%@",gamerScore];
    } else if (gameScore >= [gamerScore intValue]){
        scoreLabel.text = [NSString stringWithFormat:@"Your Best Score:  $%ld",(long)gameScore];
    }
    
    [self addChild:scoreLabel];
    
}

- (void) newGame
{
    SKScene *newGame = [[BarScene alloc]initWithSize:self.size];
    
    [self.view presentScene:newGame transition:[SKTransition doorsOpenHorizontalWithDuration:2.0]];
    [self.nameField removeFromSuperview];

}

- (void) backToMenu {
    SKScene *startScene = [[StartScene alloc]initWithSize:self.size];
    
    SKTransition *slideDown = [SKTransition moveInWithDirection:SKTransitionDirectionDown duration:1];
    [self.nameField removeFromSuperview];
    [self.view presentScene:startScene transition:slideDown];
}
@end
