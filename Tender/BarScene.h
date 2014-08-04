//
//  BarScene.h
//  Tender
//
//  Created by Yuraima Estevez on 4/29/14.
//  Copyright (c) 2014 Yuraima Estevez. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>
#import "GameOverScene.h"
#import "DrinkNode.h"
#import "Order.h"

@interface BarScene : SKScene

@property (strong, nonatomic) SKLabelNode *scoreLabel;
@property (strong, nonatomic) SKLabelNode *helpButton;
@property (strong, nonatomic) SKLabelNode *timer;
@property (strong, nonatomic) SKLabelNode *pauseButton;

@property (nonatomic) NSInteger gameScore;



@end
