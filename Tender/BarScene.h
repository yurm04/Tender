//
//  BarScene.h
//  Tender
//
//  Created by Yuraima Estevez on 4/29/14.
//  Copyright (c) 2014 Yuraima Estevez. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>
#import "GameOverScene.h"

@interface BarScene : SKScene

@property (nonatomic) NSMutableArray* strikes;                                        // Number of Lives
@property (strong, nonatomic) NSMutableString *activeOrderItemName;
@property (strong, nonatomic) NSMutableString *tappedItemName;

@property (strong, nonatomic) SKLabelNode *scoreLabel;
@property (nonatomic) CGFloat randomXPosition;

@property (nonatomic, getter = isInMotion) BOOL inMotion;
@property (nonatomic) BOOL drinkInScene;
@property (nonatomic) BOOL gameOver;
@property (nonatomic) BOOL activeOrder;

@property (nonatomic) NSInteger activeOrderItem;
@property (nonatomic) CGFloat activeOrderPosition;

@property (weak, nonatomic) SKLabelNode *helpButton;

@property (strong, nonatomic) SKLabelNode *timer;
@property (nonatomic) BOOL startFlag;
@property (nonatomic) NSTimeInterval startTime;
@property (strong, nonatomic) SKLabelNode *pauseButton;
@property (nonatomic) NSTimeInterval lastUpdate;
@property (nonatomic) BOOL isPaused;
@property (nonatomic) NSTimeInterval pausedTime;
@property (nonatomic) NSTimeInterval startPause;
@property (nonatomic) NSTimeInterval pauseStart;
@property (nonatomic) NSTimeInterval pauseEnd;
@property (nonatomic) NSTimeInterval elapsedT;
@property (nonatomic) NSTimeInterval runningTime;
@property (nonatomic) NSTimeInterval gameTime;
@property (nonatomic) BOOL unpause;




- (void)slideNodeWithXVelocity:(CGFloat)xVelocity;
- (void) displayPointsEarnedWithPoints: (NSInteger) points;
- (void) checkVelocity;
- (void) checkPosition: (CGFloat)position;
- (void) updateGameScoreWithPoints: (NSInteger)points;
- (void) toggleInMotion;
- (void) randomOrder;
- (CGFloat) newRandomPosition;
- (void) removeDrink;
- (void) newDrinkWithItem: (NSString *) item;
- (void) removeRandomOrder;
- (void) createBarItems;
- (void) endGame;



@end
