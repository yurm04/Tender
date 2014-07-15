//
//  GameOverScene.h
//  Tender
//
//  Created by Yuraima Estevez on 5/3/14.
//  Copyright (c) 2014 Yuraima Estevez. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>
#import "AppDelegate.h"
#import "StartScene.h"

@interface GameOverScene : SKScene <UITextFieldDelegate>

@property (strong, nonatomic) UITextField *nameField;
@property (strong, nonatomic) NSString* scoreString;
@property (strong, nonatomic) AppDelegate *dbHandler;


-(id)initWithSize: (CGSize)size Score:(NSInteger)score;
- (void) displayHighScore;
- (void) recordScore;
@end
