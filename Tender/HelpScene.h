//
//  HelpScene.h
//  Tender
//
//  Created by Yuraima Estevez on 7/4/14.
//  Copyright (c) 2014 Yuraima Estevez. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>

#import "StartScene.h"

@interface HelpScene : SKScene

@property (strong, nonatomic) SKLabelNode *backButton;
@property (strong, nonatomic) SKSpriteNode *background;
@property (strong, nonatomic) NSArray *screens;
@property int currentScreen;


@end
