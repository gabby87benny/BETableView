//
//  CustomCellTVC.m
//  BETableView
//
//  Created by Gabriel Benny on 12/29/15.
//  Copyright © 2015 Gabriel Benny. All rights reserved.
//

#import "CustomCellTVC.h"
#import "CustomTableViewCell.h"
#import "Person.h"

static NSString *simpleTableIdentifier = @"CustomTableViewCellId";

@interface CustomCellTVC ()<UITableViewDataSource, UITableViewDelegate> {
    NSArray *_dArray;
    __weak IBOutlet UITableView *tblView;
}
@end

@implementation CustomCellTVC

- (void)viewDidLoad {
    [super viewDidLoad];
    _dArray = [Person personsData];
    UINib *cellNib = [UINib nibWithNibName:@"CustomTableViewCell" bundle:nil];
    [tblView registerNib:cellNib forCellReuseIdentifier:simpleTableIdentifier];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark Table view datasources and delegates

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _dArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    CustomTableViewCell *cell = (CustomTableViewCell *)[tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier forIndexPath:indexPath];
    cell.person = _dArray[indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    Person *per = _dArray[indexPath.row];
    NSLog(@"Tapped %@", per.name);
}

@end
