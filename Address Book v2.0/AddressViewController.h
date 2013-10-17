//
//  AddressViewController.h
//  Address Book v2.0
//
//  Created by Jhaybie on 10/16/13.
//  Copyright (c) 2013 Jhaybie. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Address.h"
#import "Contact.h"

@interface AddressViewController : UIViewController
@property (strong, nonatomic) Contact *contact;
@end
