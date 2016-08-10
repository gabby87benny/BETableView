//
//  TableViewController.m
//  BETableView
//
//  Created by Gabriel Benny on 1/22/16.
//  Copyright © 2016 Gabriel Benny. All rights reserved.
//

#import "TableViewController.h"
#import "TableViewControllerCell.h"
#import "Person.h"

static NSString *tIdentifier = @"TableViewControllerCellId";

@interface TableViewController () {
    NSArray *_dArray;
    __weak IBOutlet UITableView *tblView;
}
@end

@implementation TableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _dArray = [Person personsData];
    UINib *cellNib = [UINib nibWithNibName:@"TableViewControllerCell" bundle:nil];
    [self.tableView registerNib:cellNib forCellReuseIdentifier:tIdentifier];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _dArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    TableViewControllerCell *cell = (TableViewControllerCell *)[tableView dequeueReusableCellWithIdentifier:tIdentifier forIndexPath:indexPath];
    cell.person = _dArray[indexPath.row];
    return cell;
}

#pragma mark - Table view delegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
}

@end
