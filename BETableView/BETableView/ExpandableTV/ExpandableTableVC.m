//
//  ExpandableTableVC.m
//  BETableView
//
//  Created by Gabriel Benny on 1/4/16.
//  Copyright © 2016 Gabriel Benny. All rights reserved.
//

#import "ExpandableTableVC.h"
#import "Person.h"
#import "ExpandableTVCell.h"

static NSString *simpleTableIdentifier = @"ExpandableTVCellId";

@interface ExpandableTableVC ()<UITableViewDataSource, UITableViewDelegate, ExpandableTVCellDelegate> {
    NSMutableArray *_dArray;
    __weak IBOutlet UITableView *tblView;
}
@end

@implementation ExpandableTableVC

- (void)viewDidLoad {
    [super viewDidLoad];
    //_dArray = [NSMutableArray arrayWithArray:[Person personsData]];
    
    _dArray = [[NSMutableArray alloc] initWithObjects:@"A",@"B", nil];
    UINib *cellNib = [UINib nibWithNibName:@"ExpandableTVCell" bundle:nil];
    [tblView registerNib:cellNib forCellReuseIdentifier:simpleTableIdentifier];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)addCell:(id)sender {
    [_dArray addObject:@"C"];
    
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:[_dArray count] - 1 inSection:0];
    NSMutableArray *indexPathsToAdd = [NSMutableArray new];
    [indexPathsToAdd addObject:indexPath];
    [tblView beginUpdates];
    [tblView insertRowsAtIndexPaths:indexPathsToAdd withRowAnimation:UITableViewRowAnimationAutomatic];
    [tblView endUpdates];
}

#pragma mark Table view datasources and delegates

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _dArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ExpandableTVCell *cell = (ExpandableTVCell *)[tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier forIndexPath:indexPath];
    //cell.person = _dArray[indexPath.row];
    cell.delegate = self;
    cell.rIndex = indexPath.row;
    cell.nameLbl.text = _dArray[indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
   // Person *per = _dArray[indexPath.row];
   // NSLog(@"Tapped %@", per.name);
}


#pragma mark ExpandableTVCell delegate

-(void)removeCell:(ExpandableTVCell *)cell atIndex:(NSInteger)index {
    //TODO
    //Logic change
    [_dArray removeObjectAtIndex:index];
    
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:index inSection:0];
    NSMutableArray *indexPathsToDelete = [NSMutableArray new];
    [indexPathsToDelete addObject:indexPath];
    //[tblView beginUpdates];
    [tblView deleteRowsAtIndexPaths:indexPathsToDelete withRowAnimation:UITableViewRowAnimationAutomatic];
    //[tblView endUpdates];
    [tblView reloadData];
}


@end
