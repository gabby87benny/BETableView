//
//  SectionedTVC.m
//  BETableView
//
//  Created by Gabriel Benny on 12/30/15.
//  Copyright © 2015 Gabriel Benny. All rights reserved.
//

#import "SectionedTVC.h"
#import "Person.h"

@interface SectionedTVC ()<UITableViewDataSource, UITableViewDelegate>
{
    __weak IBOutlet UITableView *sectionTblView;
}
@property (nonatomic, strong) NSMutableArray *sectionsArray;
@property (nonatomic, strong) UILocalizedIndexedCollation *collation;
@property (nonatomic, strong) NSArray *dataArray;
@end

@implementation SectionedTVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.collation = [UILocalizedIndexedCollation currentCollation];
    NSInteger sectionTitlesCount = [[self.collation sectionTitles] count];
    NSMutableArray *sArray = [NSMutableArray new];
    
    //Form Empty array
    for(NSInteger i = 0; i< sectionTitlesCount; i++) {
        NSMutableArray *rArray = [NSMutableArray new];
        [sArray addObject:rArray];
    }
    
    _dataArray = [Person personsData];
    
    //Data grouping
    for(Person *person in _dataArray) {
        NSInteger sectionNumber = [self.collation sectionForObject:person collationStringSelector:@selector(name)];
        NSMutableArray *rowArr = sArray[sectionNumber];
        [rowArr addObject:person];
    }
    
    // Data sorting
    for (int index = 0; index < sectionTitlesCount; index++) {
        NSMutableArray *unsortedArray = sArray[index];
        // If the table view or its contents were editable, you would make a mutable copy here.
        NSArray *sortedArray = [self.collation sortedArrayFromArray:unsortedArray collationStringSelector:@selector(self)];
        // Replace the existing array with the sorted array.
        sArray[index] = sortedArray;
    }
    
    self.sectionsArray = sArray;
}

#pragma mark - Table view data source and delegate methods

/*
 Section-related methods: Retrieve the section titles and section index titles from the collation.
 */

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    NSPredicate *predicate = [NSPredicate predicateWithFormat:
                              @"(self.name BEGINSWITH[c] %@)", [self.collation sectionTitles][section]];
    NSArray *dContent = [_dataArray filteredArrayUsingPredicate:predicate];
    return [dContent count] > 0?[self.collation sectionTitles][section]:nil;
}

- (NSArray *)sectionIndexTitlesForTableView:(UITableView *)tableView {
    return [self.collation sectionIndexTitles];
}

- (NSInteger)tableView:(UITableView *)tableView sectionForSectionIndexTitle:(NSString *)title atIndex:(NSInteger)index {
    return [self.collation sectionForSectionIndexTitleAtIndex:index];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return [[self.collation sectionTitles] count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSArray *rowObjs = (self.sectionsArray)[section];
    return [rowObjs count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *simpleTableIdentifier = @"SimpleTableItem";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:simpleTableIdentifier];
    }
    NSArray *sectionArray = (self.sectionsArray)[indexPath.section];
    Person *per = sectionArray[indexPath.row];
    cell.textLabel.text = per.name;
    return cell;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
