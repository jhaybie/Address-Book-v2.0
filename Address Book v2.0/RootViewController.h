//
//  ViewController.h
//  Address Book v2.0
//
//  Created by Jhaybie on 10/14/13.
//  Copyright (c) 2013 Jhaybie. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AddViewController.h"
#import "Contact.h"
#import "DetailViewController.h"

@interface RootViewController : UIViewController <UITableViewDataSource, UITableViewDelegate, NSFetchedResultsControllerDelegate>
@end
