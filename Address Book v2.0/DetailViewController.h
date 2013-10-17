//
//  EditViewController.h
//  Address Book v2.0
//
//  Created by Jhaybie on 10/15/13.
//  Copyright (c) 2013 Jhaybie. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Address.h"
#import "Contact.h"
#import "Tag.h"

@interface DetailViewController : UIViewController
@property (weak, nonatomic) Contact *contact;
@end
