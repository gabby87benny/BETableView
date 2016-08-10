//
//  ExpandableTVCell.m
//  BETableView
//
//  Created by Gabriel Benny on 1/4/16.
//  Copyright © 2016 Gabriel Benny. All rights reserved.
//

#import "ExpandableTVCell.h"

@interface ExpandableTVCell () {
    __weak IBOutlet UIButton *_btnRemove;
}

@end

@implementation ExpandableTVCell

- (void)awakeFromNib {
    // Initialization code
    //_nameLbl.text = _dString;
}

-(void)setPerson:(Person *)person {
    _person = person;
    
}

-(IBAction)deleteCell:(id)sender {
    [self.delegate removeCell:self atIndex:_rIndex];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
