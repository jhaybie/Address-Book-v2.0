//
//  Tag.h
//  Address Book v2.0
//
//  Created by Jhaybie on 10/16/13.
//  Copyright (c) 2013 Jhaybie. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Contact;

@interface Tag : NSManagedObject
@property (nonatomic, retain) NSString * tag;
@property (nonatomic, retain) NSSet *contacts;
@end

@interface Tag (CoreDataGeneratedAccessors)
- (void)addContactsObject:(Contact *)value;
- (void)removeContactsObject:(Contact *)value;
- (void)addContacts:(NSSet *)values;
- (void)removeContacts:(NSSet *)values;
@end
