//
//  SecondViewController.h
//  Address Book v2.0
//
//  Created by Jhaybie on 10/14/13.
//  Copyright (c) 2013 Jhaybie. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Address.h"
#import "AddressViewController.h"
#import "Contact.h"
#import "Tag.h"

@interface AddViewController : UIViewController
@property (strong, nonatomic) Contact *contact;
@end
