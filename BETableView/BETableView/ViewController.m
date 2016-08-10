//
//  ViewController.m
//  BETableView
//
//  Created by Gabriel Benny on 11/24/15.
//  Copyright © 2015 Gabriel Benny. All rights reserved.
//

#import "ViewController.h"

#import "SimpleTVC.h"
#import "CustomCellTVC.h"
#import "SectionedTVC.h"
#import "ExpandableTableVC.h"
#import "EditableTVC.h"
#import "TableViewController.h"

@interface ViewController ()
@property(nonatomic, strong) SimpleTVC *sTvc;
@property(nonatomic, strong) CustomCellTVC *customTvc;
@property(nonatomic, strong) SectionedTVC *sectionedTvc;
@property(nonatomic, strong) ExpandableTableVC *expandVC;
@property(nonatomic, strong) EditableTVC *editableVC;
@property(nonatomic, strong) TableViewController *tableVC;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //Simple table view
    //[self showSimpleTVC];
    //[self showCustomCellTVC];
    //[self showSectionedTVC];
    //[self showExpandableTVC];
    //[self showEditableTVC];
    [self showTABLEVIEWCONTROLLER];
}

-(void)showSimpleTVC {
    _sTvc = [SimpleTVC new];
    [self.view addSubview:_sTvc.view];
}

-(void)showCustomCellTVC {
    _customTvc = [CustomCellTVC new];
    [self.view addSubview:_customTvc.view];
}

-(void)showSectionedTVC {
    _sectionedTvc = [SectionedTVC new];
    [self.view addSubview:_sectionedTvc.view];
}

-(void)showExpandableTVC {
    _expandVC = [ExpandableTableVC new];
    [self.view addSubview:_expandVC.view];
}

-(void)showEditableTVC {
    _editableVC = [EditableTVC new];
    [self.view addSubview:_editableVC.view];
}

-(void)showTABLEVIEWCONTROLLER {
    _tableVC = [TableViewController new];
    [self.view addSubview:_tableVC.view];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
