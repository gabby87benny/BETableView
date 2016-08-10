//
//  TableViewControllerCell.m
//  BETableView
//
//  Created by Gabriel Benny on 1/22/16.
//  Copyright © 2016 Gabriel Benny. All rights reserved.
//

#import "TableViewControllerCell.h"

@interface TableViewControllerCell () {
    __weak IBOutlet UILabel *_nameLbl;
}

@end

@implementation TableViewControllerCell

-(void)setPerson:(Person *)person {
    _person = person;
    _nameLbl.text = _person.name;
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
