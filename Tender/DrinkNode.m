//
//  DrinkNode.m
//  Tender
//
//  Created by Yuraima Estevez on 7/16/14.
//  Copyright (c) 2014 Yuraima Estevez. All rights reserved.
//

#import "DrinkNode.h"

@implementation DrinkNode

-(instancetype)initWithItemNamed:(NSString *)item {
    self = [super init];
    
    if (self) {
        self.name = @"drink";
        self.texture = [SKTexture textureWithImageNamed:item];
        _item = item;
        _inQueue = YES;
        self.physicsBody = [[SKPhysicsBody alloc]init];
        self.physicsBody.linearDamping = 1.0;
        self.physicsBody.dynamic = YES;
        
    }
    
    return self;
}




@end
