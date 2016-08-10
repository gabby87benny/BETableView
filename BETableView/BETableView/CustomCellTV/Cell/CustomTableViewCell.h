//
//  CustomTableViewCell.h
//  BETableView
//
//  Created by Gabriel Benny on 1/4/16.
//  Copyright © 2016 Gabriel Benny. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Person.h"

@interface CustomTableViewCell : UITableViewCell
@property(nonatomic, strong) Person *person;
@end
