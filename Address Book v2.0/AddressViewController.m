//
//  AddressViewController.m
//  Address Book v2.0
//
//  Created by Jhaybie on 10/16/13.
//  Copyright (c) 2013 Jhaybie. All rights reserved.
//

#import "AddressViewController.h"

@interface AddressViewController ()
@property (weak, nonatomic) IBOutlet UITextField *addressTypeTextField;
@property (weak, nonatomic) IBOutlet UITextField *address1TextField;
@property (weak, nonatomic) IBOutlet UITextField *address2TextField;
@property (weak, nonatomic) IBOutlet UITextField *cityTextField;
@property (weak, nonatomic) IBOutlet UITextField *stateTextField;
@property (weak, nonatomic) IBOutlet UITextField *zipTextField;
@property (strong, nonatomic) Address *address;
@end

@implementation AddressViewController
@synthesize contact,
            addressTypeTextField,
            address1TextField,
            address2TextField,
            cityTextField,
            stateTextField,
            zipTextField;

- (IBAction)onDoneButtonPress:(id)sender {
    Address *address = [NSEntityDescription insertNewObjectForEntityForName:@"Address"
                                                     inManagedObjectContext:[UIApplication moc]];
    address.addressType = addressTypeTextField.text;
    address.address1 = address1TextField.text;
    address.address2 = address2TextField.text;
    address.city = cityTextField.text;
    address.state = stateTextField.text.uppercaseString;
    address.zip = zipTextField.text;
    [contact addAddressesObject:address];
    [[UIApplication moc] save:nil];
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [addressTypeTextField becomeFirstResponder];
}
@end
