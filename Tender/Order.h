//
//  Order.h
//  Tender
//
//  Created by Yuraima Estevez on 7/16/14.
//  Copyright (c) 2014 Yuraima Estevez. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>

@interface Order : SKSpriteNode

@property (strong, nonatomic) NSString *item;
@property (strong, nonatomic) SKSpriteNode *drink;
@property (nonatomic) NSTimeInterval startTime;
@property (nonatomic) NSTimeInterval lifeTime;

-(instancetype)initWithItemNamed:(NSString *)name;

@end
