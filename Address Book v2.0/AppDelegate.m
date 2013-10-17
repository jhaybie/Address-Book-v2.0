//
//  AppDelegate.m
//  Address Book v2.0
//
//  Created by Jhaybie on 10/14/13.
//  Copyright (c) 2013 Jhaybie. All rights reserved.
//

#import "AppDelegate.h"

@implementation AppDelegate
NSManagedObjectContext *moc;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    [self setupCoreData];
    return YES;
}

- (NSManagedObjectContext *)managedObjectContext {
    return moc;
}

- (void)setupCoreData {
    NSManagedObjectModel *mom;
    NSPersistentStoreCoordinator *persistentStoreCoordinator;
    NSURL *documentsDirectoryURL = [[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory
                                                                           inDomains:NSUserDomainMask] lastObject];
    NSURL *modelURL = [[NSBundle mainBundle] URLForResource:@"Model"
                                              withExtension:@"momd"];
    NSURL *sqliteURL = [documentsDirectoryURL URLByAppendingPathComponent:@"Model.sqlite"];
    mom = [[NSManagedObjectModel alloc] initWithContentsOfURL:modelURL];
    persistentStoreCoordinator = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:mom];
    
    if ([persistentStoreCoordinator addPersistentStoreWithType:NSSQLiteStoreType
                                                 configuration:nil
                                                           URL:sqliteURL
                                                       options:nil
                                                         error:nil]) {
        moc = [[NSManagedObjectContext alloc] init];
        [moc setPersistentStoreCoordinator:persistentStoreCoordinator];
    }
}
@end


@implementation UIApplication (CoreData)

+ (id)moc {
    return [(AppDelegate *)[[UIApplication sharedApplication] delegate] managedObjectContext];
}
@end
