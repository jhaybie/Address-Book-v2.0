//
//  ViewController.m
//  Address Book v2.0
//
//  Created by Jhaybie on 10/14/13.
//  Copyright (c) 2013 Jhaybie. All rights reserved.
//

#import "RootViewController.h"

@interface RootViewController ()
@property (weak, nonatomic) IBOutlet UITableView *contactsTableView;
@end


@implementation RootViewController
@synthesize contactsTableView;

NSFetchedResultsController *fetchedResultsController;
NSURL                      *documentDirectory;


-(void) loadContacts {
    NSEntityDescription *entityDescription = [NSEntityDescription entityForName:@"Contact"
                                                         inManagedObjectContext:[UIApplication moc]];
    NSError *error;
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    fetchRequest.entity = entityDescription;
    fetchRequest.sortDescriptors = @[[[NSSortDescriptor alloc] initWithKey:@"firstName"
                                                                 ascending:YES]];
    fetchedResultsController = [[NSFetchedResultsController alloc] initWithFetchRequest:fetchRequest
                                                                   managedObjectContext:[UIApplication moc]
                                                                     sectionNameKeyPath:nil
                                                                              cacheName:nil];
    [fetchedResultsController performFetch:&error];
    fetchedResultsController.delegate = self;
    NSLog(@"Error: %@", error);
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self loadContacts];
}

- (IBAction)onAddButtonPress:(id)sender {
    AddViewController *avc = [self.storyboard instantiateViewControllerWithIdentifier:@"AddViewController"];
    avc.contact = [NSEntityDescription insertNewObjectForEntityForName:@"Contact"
                                                inManagedObjectContext:[UIApplication moc]];
    [self.navigationController pushViewController:avc
                                         animated:YES];
}

-(void)controller:(NSFetchedResultsController *)controller
  didChangeObject:(id)anObject
      atIndexPath:(NSIndexPath *)indexPath
    forChangeType:(NSFetchedResultsChangeType)type
     newIndexPath:(NSIndexPath *)newIndexPath {
    [contactsTableView reloadData];
}

-       (void)tableView:(UITableView *)tableView
didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    DetailViewController *evc = [self.storyboard instantiateViewControllerWithIdentifier:@"EditViewController"];
    evc.contact = fetchedResultsController.fetchedObjects[indexPath.row];
    [self.navigationController pushViewController:evc
                                         animated:YES];
}

-(UITableViewCell *)tableView:(UITableView *)tableView
        cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *reuseID = @"xxx";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseID];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1
                                      reuseIdentifier:reuseID];
    }
    Contact *temp = fetchedResultsController.fetchedObjects[indexPath.row];
    cell.textLabel.text = [NSString stringWithFormat:@"%@ %@", temp.firstName, temp.lastName];
    cell.textLabel.font = [UIFont systemFontOfSize:16.0f];
    cell.detailTextLabel.numberOfLines = 2;
    cell.detailTextLabel.text = [NSString stringWithFormat:@"%@\n%@", temp.phoneNumber, temp.emailAddress];
    cell.detailTextLabel.font = [UIFont systemFontOfSize:12.0f];
    return cell;
    [contactsTableView reloadData];
}

-  (void)tableView:(UITableView *)tableView
commitEditingStyle:(UITableViewCellEditingStyle)editingStyle
 forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        NSManagedObjectContext *managedObjectContext = [UIApplication moc];
        Contact *contactToDelete = [fetchedResultsController objectAtIndexPath:indexPath];
        [managedObjectContext deleteObject:contactToDelete];
        [[UIApplication moc] save:nil];
    }
}

-(NSInteger)tableView:(UITableView *)tableView
numberOfRowsInSection:(NSInteger)section {
    return fetchedResultsController.fetchedObjects.count;
}
@end
