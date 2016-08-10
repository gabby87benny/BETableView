//
//  CustomTableViewCell.m
//  BETableView
//
//  Created by Gabriel Benny on 1/4/16.
//  Copyright © 2016 Gabriel Benny. All rights reserved.
//

#import "CustomTableViewCell.h"

@interface CustomTableViewCell () {
    __weak IBOutlet UILabel *_nameLbl;
}

@end

@implementation CustomTableViewCell

-(void)setPerson:(Person *)person {
    _person = person;
    _nameLbl.text = _person.name;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
