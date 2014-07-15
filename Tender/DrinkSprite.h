//
//  DrinkSprite.h
//  Tender
//
//  Created by Yuraima Estevez on 5/3/14.
//  Copyright (c) 2014 Yuraima Estevez. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>

@interface DrinkSprite : SKSpriteNode

@property (strong, nonatomic) NSString *type;
@property (nonatomic, getter = isInMotion) BOOL inMotion;

- (instancetype) init;
@end
