//
//  AppDelegate.h
//  Tender
//
//  Created by Yuraima Estevez on 4/29/14.
//  Copyright (c) 2014 Yuraima Estevez. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <sqlite3.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

// Database Stuff
@property (nonatomic) sqlite3 *tenderDB;
@property (strong, nonatomic) NSString *databasePath;
@property (strong, nonatomic) AppDelegate *dbHandler;

- (BOOL) insertName: (NSString *)name Score: (NSString *)score;
- (NSString *) getHighScoreWithName: (NSString *) name;
@end
