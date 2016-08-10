//
//  SimpleTVC.m
//  BETableView
//
//  Created by Gabriel Benny on 12/29/15.
//  Copyright © 2015 Gabriel Benny. All rights reserved.
//

#import "SimpleTVC.h"
#import "Person.h"

@interface SimpleTVC ()<UITableViewDataSource, UITableViewDelegate> {
    NSArray *_dArray;
    __weak IBOutlet UITableView *tblView;
}
@end

@implementation SimpleTVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    _dArray = [Person personsData];
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
    static NSString *simpleTableIdentifier = @"SimpleTableItem";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:simpleTableIdentifier];
    }
    Person *per = _dArray[indexPath.row];
    cell.textLabel.text = per.name;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    Person *per = _dArray[indexPath.row];
    NSLog(@"Tapped %@", per.name);
}

@end
