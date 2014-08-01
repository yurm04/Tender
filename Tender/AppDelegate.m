//
//  AppDelegate.m
//  Tender
//
//  Created by Yuraima Estevez on 4/29/14.
//  Copyright (c) 2014 Yuraima Estevez. All rights reserved.
//

#import "AppDelegate.h"
#import "BarScene.h"

@implementation AppDelegate

+ (AppDelegate *)sharedDelegate
{
    return (AppDelegate *) [[UIApplication sharedApplication] delegate];
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Override point for customization after application launch.
    // DB Setup
    NSString *docsDir;
    NSArray *dirPath;
    
    // Getting the documents directory
    dirPath = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    
    docsDir = dirPath[0];
    
    // Build the path to the database file
    self.databasePath = [[NSString alloc] initWithString:[docsDir stringByAppendingPathComponent:@"Tender.db"]];
    
    NSFileManager *filemgr = [NSFileManager defaultManager];
    
    if ([filemgr fileExistsAtPath: self.databasePath ] == NO)
    {
        const char *dbpath = [self.databasePath UTF8String];
        
        if (sqlite3_open(dbpath, &_tenderDB) == SQLITE_OK)
        {
            char *errMsg;
            
            // Creates MemeGen table if one doesn't already exist
            const char *sql_stmt =
            "CREATE TABLE IF NOT EXISTS highscores (ID INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT, score TEXT)";
            
            // Logs to see what's going on
            if (sqlite3_exec(self.tenderDB, sql_stmt, NULL, NULL, &errMsg) == SQLITE_OK)
            {
                NSLog(@"Created table");
            }
            
            sqlite3_close(self.tenderDB);
            
        }
        else {
            NSLog(@"Failed to open/create database");
        }
    }

    
    return YES;
}

// Getter for databasePath property
- (NSString *) databasePath
{
    if (!_databasePath) {
        NSString *docsDir;
        NSArray *dirPath;
        
        // Getting the documents directory
        dirPath = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
        
        docsDir = dirPath[0];
        
        // Build the path to the database file
        _databasePath = [[NSString alloc] initWithString:[docsDir stringByAppendingPathComponent:@"Tender.db"]];
    }
    return _databasePath;
}

- (BOOL) insertName: (NSString *)name Score: (NSString *)score
{
    sqlite3_stmt    *statement;
    const char *dbpath = [self.databasePath UTF8String];
    BOOL saved = NO;
    if (sqlite3_open(dbpath, &_tenderDB) == SQLITE_OK)
    {
        
        NSString *insertSQL = [NSString stringWithFormat:
                               @"INSERT INTO highscores (name, score) VALUES (\"%@\", \"%@\")",
                               name, score];
        
        const char *insert_stmt = [insertSQL UTF8String];
        
        sqlite3_prepare_v2(self.tenderDB, insert_stmt,
                           -1, &statement, NULL);
        
        if (sqlite3_step(statement) == SQLITE_DONE)
        {
            
            saved = YES;
        } else {
            
            saved = NO;
        }
        
        sqlite3_finalize(statement);
        sqlite3_close(self.tenderDB);
        
    }
    
    return saved;
}

- (NSString *) getHighScoreWithName: (NSString *) name
{
    const char *dbpath = [self.databasePath UTF8String];
    sqlite3_stmt    *statement;
    NSString *score;
    
    if (sqlite3_open(dbpath, &_tenderDB) == SQLITE_OK)
    {
        NSString *querySQL = [NSString stringWithFormat:@"SELECT MAX(score) FROM highscores WHERE name=%@",name];
        
        const char *query_stmt = [querySQL UTF8String];
        
        if (sqlite3_prepare_v2(self.tenderDB, query_stmt, -1, &statement, NULL) == SQLITE_OK)
        {
            score = [[NSString alloc] initWithUTF8String:(const char *) sqlite3_column_text(statement, 2)];
        }
        sqlite3_finalize(statement);
        sqlite3_close(self.tenderDB);
    }
    return score;

}

// Pause scene when game goes into background
-(void)applicationWillResignActive:(UIApplication *)application {
    // Pause sprite kit
    NSLog(@"Became Inactive");
    SKView *view = (SKView *) self.window.rootViewController.view;
    view.paused = YES;
}

// Resume scene when game becomes active again
-(void)applicationDidBecomeActive:(UIApplication *)application {
    NSLog(@"Became Active");
    SKView *view = (SKView *) self.window.rootViewController.view;
    view.paused = NO;
}


@end
