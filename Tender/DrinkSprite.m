//
//  DrinkSprite.m
//  Tender
//
//  Created by Yuraima Estevez on 5/3/14.
//  Copyright (c) 2014 Yuraima Estevez. All rights reserved.
//

#import "DrinkSprite.h"

@implementation DrinkSprite

- (instancetype) init
{
    if (self = [super init]) {
        self = [DrinkSprite spriteNodeWithImageNamed:@"big1.png"];
        self.position = CGPointMake(CGRectGetMidX(self.frame) - 200, CGRectGetMidY(self.frame));
        self.name = @"drink";
        [self setScale:0.5];
        
        // Adding PhysicsBody to sprite
        self.physicsBody = [[SKPhysicsBody alloc]init];
        self.physicsBody.linearDamping = 1.0;
        self.physicsBody.dynamic = YES;
        self.physicsBody.mass = 10;             // Edges only collide with volume based bodies
    }
    return self;
}



@end
