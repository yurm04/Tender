//
//  BarTap.h
//  Tender
//
//  Created by Yuraima Estevez on 5/3/14.
//  Copyright (c) 2014 Yuraima Estevez. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>

@interface BarTap : SKSpriteNode

@property (strong, nonatomic) NSString *tapNumber;
@property (strong, nonatomic) UITapGestureRecognizer *tapRecognizer;
@property (strong, nonatomic) NSMutableArray *allTextures;

-(id)initWithTapNumber: (NSString *) number;
- (void) pour;
- (void) animateTap;
@end
