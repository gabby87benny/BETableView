//
//  EditableTVC.m
//  BETableView
//
//  Created by Gabriel Benny on 1/6/16.
//  Copyright © 2016 Gabriel Benny. All rights reserved.
//

#import "EditableTVC.h"
#import "Person.h"
#import "EditableTableViewCell.h"

static NSString *simpleTableIdentifier = @"EditableTableViewCellId";

@interface EditableTVC ()<UITableViewDataSource, UITableViewDelegate> {
    NSMutableArray *_dArray;
    __weak IBOutlet UITableView *tblView;
    __weak IBOutlet UIButton *editBtn;
}
@end

@implementation EditableTVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    _dArray = [NSMutableArray arrayWithArray:[Person personsData]];
    UINib *cellNib = [UINib nibWithNibName:@"EditableTableViewCell" bundle:nil];
    [tblView registerNib:cellNib forCellReuseIdentifier:simpleTableIdentifier];
    [editBtn setTitle:@"edit" forState:UIControlStateNormal];
}

-(IBAction)editClicked:(id)sender {
    if(self.editing) {
        [super setEditing:NO animated:YES];
        [editBtn setTitle:@"edit" forState:UIControlStateNormal];
        [tblView setEditing:NO animated:YES];
    }
    else {
        [super setEditing:YES animated:YES];
        [editBtn setTitle:@"done" forState:UIControlStateNormal];
        [tblView setEditing:YES animated:YES];
    }
    [tblView reloadData];
}

//TODO - Contraint issue in table - delete button not showing - also try uitableViewController

#pragma mark Table view datasources and delegates
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    int count = [_dArray count];
    if(self.editing) count++;
    return count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    EditableTableViewCell *cell = (EditableTableViewCell *)[tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier forIndexPath:indexPath];
    
    if((indexPath.row == [_dArray count]) && self.editing){
        cell.textLabel.text = @"add new row";
        return cell;
    }
    
    cell.person = _dArray[indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    Person *per = _dArray[indexPath.row];
    NSLog(@"Tapped %@", per.name);
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}

- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if(self.editing && (indexPath.row == [_dArray count])) {
        return NO;
    }
    return YES;
}

- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
    //if(self.editing && (toIndexPath.row != [_dArray count])) {
        Person *fObj = [_dArray objectAtIndex:fromIndexPath.row];
        [_dArray removeObjectAtIndex:fromIndexPath.row];
        [_dArray insertObject:fObj atIndex:toIndexPath.row];
        //[tblView setEditing:NO animated:YES];
    //}
}

- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath {
    // No editing style if not editing or the index path is nil.
    if (self.editing == NO || !indexPath) return UITableViewCellEditingStyleNone;
    // Determine the editing style based on whether the cell is a placeholder for adding content or already
    // existing content. Existing content can be deleted.
    if (self.editing && (indexPath.row == [_dArray count])) {
        return UITableViewCellEditingStyleInsert;
    } else {
        return UITableViewCellEditingStyleDelete;
    }
    return UITableViewCellEditingStyleNone;
}


- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if(editingStyle == UITableViewCellEditingStyleInsert) {
        Person *nPerson = [Person new];
        nPerson.name = @"new fella";
        nPerson.company = @"new cpmpay";
        [_dArray addObject:nPerson];
        //[tableView insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
        [tableView reloadData];
    }
    else if(editingStyle == UITableViewCellEditingStyleDelete){
        [_dArray removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
