//
//  EditViewController.m
//  Address Book v2.0
//
//  Created by Jhaybie on 10/15/13.
//  Copyright (c) 2013 Jhaybie. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()
@property (weak, nonatomic) IBOutlet UITextField *firstNameTextField;
@property (weak, nonatomic) IBOutlet UITextField *lastNameTextField;
@property (weak, nonatomic) IBOutlet UITextField *emailAddressTextField;
@property (weak, nonatomic) IBOutlet UITextField *phoneNumberTextField;
@end

@implementation DetailViewController
@synthesize contact,
            firstNameTextField,
            lastNameTextField,
            emailAddressTextField,
            phoneNumberTextField;



- (IBAction)onDoneButtonPress:(id)sender {
    if ([self.navigationItem.rightBarButtonItem.title isEqualToString:@"Edit"]) {
        firstNameTextField.enabled = YES;
        lastNameTextField.enabled = YES;
        emailAddressTextField.enabled = YES;
        phoneNumberTextField.enabled = YES;
        self.navigationItem.rightBarButtonItem.title = @"Done";
        [firstNameTextField becomeFirstResponder];
    } else {
        contact.firstName = firstNameTextField.text;
        contact.lastName = lastNameTextField.text;
        contact.emailAddress = emailAddressTextField.text;
        contact.phoneNumber = phoneNumberTextField.text;
        [[UIApplication moc] save:nil];
        [self.navigationController popToRootViewControllerAnimated:YES];
    }
}

-(void)viewDidAppear:(BOOL)animated {
    firstNameTextField.text = contact.firstName;
    firstNameTextField.enabled = NO;
    lastNameTextField.text = contact.lastName;
    lastNameTextField.enabled = NO;
    emailAddressTextField.text = contact.emailAddress;
    emailAddressTextField.enabled = NO;
    phoneNumberTextField.text = contact.phoneNumber;
    phoneNumberTextField.enabled = NO;
}

- (void)viewDidLoad {
    [super viewDidLoad];
}
@end
