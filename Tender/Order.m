//
//  Order.m
//  Tender
//
//  Created by Yuraima Estevez on 7/16/14.
//  Copyright (c) 2014 Yuraima Estevez. All rights reserved.
//

#import "Order.h"

@implementation Order

-(instancetype)initWithItemNamed:(NSString *)item CreationTime: (NSTimeInterval)creation ActiveTime: (NSTimeInterval)active {

    self = [super init];
    
    if (self) {
        _item = item;
        _becameActive = creation;
        _remainActive = active;
        SKSpriteNode *bubble = [SKSpriteNode spriteNodeWithImageNamed:@"bubble.png"];
        _drink = [SKSpriteNode spriteNodeWithImageNamed:item];
        _drink.position = self.position;
        _timedOut = NO;
        [self addChild:bubble];
        [self addChild:_drink];
    }
    
    return self;
}

@end
