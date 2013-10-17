//
//  SecondViewController.m
//  Address Book v2.0
//
//  Created by Jhaybie on 10/14/13.
//  Copyright (c) 2013 Jhaybie. All rights reserved.
//

#import "AddViewController.h"

@interface AddViewController ()
@property (strong, nonatomic) IBOutlet UITextField *firstNameTextField;
@property (strong, nonatomic) IBOutlet UITextField *lastNameTextField;
@property (strong, nonatomic) IBOutlet UITextField *emailAddressTextField;
@property (strong, nonatomic) IBOutlet UITextField *phoneNumberTextField;
@property (weak, nonatomic) IBOutlet UITableView *addressTableView;
@end


@implementation AddViewController
@synthesize contact,
            firstNameTextField,
            lastNameTextField,
            emailAddressTextField,
            phoneNumberTextField;


- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)viewDidAppear:(BOOL)animated {
    [self.firstNameTextField becomeFirstResponder];
}

//-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
//    AddressViewController *avc = segue.destinationViewController;
//    avc.address = [NSEntityDescription insertNewObjectForEntityForName:@"Address"
//                                                inManagedObjectContext:[UIApplication moc]];
//}

- (IBAction)onDoneButtonPress:(id)sender {
    contact.firstName = [NSString stringWithFormat:@"%@", firstNameTextField.text];
    contact.lastName = [NSString stringWithFormat:@"%@", lastNameTextField.text];
    contact.emailAddress = [NSString stringWithFormat:@"%@", emailAddressTextField.text];
    contact.phoneNumber = [NSString stringWithFormat:@"%@", phoneNumberTextField.text];
    
    [[UIApplication moc] save:nil];
    [self.navigationController popToRootViewControllerAnimated:YES];
}
@end
