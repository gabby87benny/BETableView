//
//  EditableTableViewCell.m
//  BETableView
//
//  Created by Gabriel Benny on 1/18/16.
//  Copyright © 2016 Gabriel Benny. All rights reserved.
//

#import "EditableTableViewCell.h"

@interface EditableTableViewCell () {
    __weak IBOutlet UILabel *_nameLbl;
}

@end

@implementation EditableTableViewCell

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
