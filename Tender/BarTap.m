//
//  BarTap.m
//  Tender
//
//  Created by Yuraima Estevez on 5/3/14.
//  Copyright (c) 2014 Yuraima Estevez. All rights reserved.
//

#import "BarTap.h"

@implementation BarTap

-(id)initWithTapNumber: (NSString *) number
{
    if (self = [super init]) {
        self.tapNumber = number;
        self.name = [NSString stringWithFormat:@"tap%@", number];
        SKTextureAtlas *tapAtlas = [SKTextureAtlas atlasNamed:self.name];
        
        self.tapRecognizer = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(pour)];

        // Get the list of texture names, and sort them
        NSArray* textureNames = [[tapAtlas textureNames] sortedArrayUsingSelector:@selector(compare:)];
        
        // Load all textures
        self.allTextures = [NSMutableArray array];
        
        for (NSString* textureName in textureNames) {
            [self.allTextures addObject:[tapAtlas textureNamed:textureName]];
        }
        
        // Create the sprite, and give it the initial frame; position it in the middle of the screen
        self = [BarTap spriteNodeWithTexture:self.allTextures[0]];

    }
    return self;
}

- (void) animateTap
{
    SKAction *tapAnimation = [SKAction animateWithTextures:self.allTextures timePerFrame:(1.0/30.0)];
    [self runAction:tapAnimation];
}


@end
