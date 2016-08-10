//
//  EditableTableViewCell.h
//  BETableView
//
//  Created by Gabriel Benny on 1/18/16.
//  Copyright © 2016 Gabriel Benny. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Person.h"

@interface EditableTableViewCell : UITableViewCell
@property(nonatomic, strong) Person *person;
@end
