//
//  ExpandableTVCell.h
//  BETableView
//
//  Created by Gabriel Benny on 1/4/16.
//  Copyright © 2016 Gabriel Benny. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Person.h"

@class ExpandableTVCell;

@protocol ExpandableTVCellDelegate <NSObject>
-(void)removeCell:(ExpandableTVCell *)cell atIndex:(NSInteger)index;
@end

@interface ExpandableTVCell : UITableViewCell

@property(nonatomic, weak) IBOutlet UILabel *nameLbl;
@property(nonatomic, strong) Person *person;
@property(nonatomic, strong) NSString *dString;
@property(nonatomic, assign) id<ExpandableTVCellDelegate> delegate;
@property(nonatomic) NSInteger rIndex;
@end
