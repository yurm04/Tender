//
//  DrinkNode.h
//  Tender
//
//  Created by Yuraima Estevez on 7/16/14.
//  Copyright (c) 2014 Yuraima Estevez. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>

@interface DrinkNode : SKSpriteNode

@property (nonatomic, getter = isInMotion) BOOL inMotion;
@property (nonatomic, getter = isInQueue) BOOL inQueue;
@property (strong, nonatomic) NSString *item;

-(instancetype) initWithItemNamed:(NSString *)item;


@end
