//
//  Person.h
//  BETableView
//
//  Created by Gabriel Benny on 12/30/15.
//  Copyright © 2015 Gabriel Benny. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject
@property(nonatomic, strong) NSString *name;
@property(nonatomic, strong) NSString *company;

+(NSArray *)personsData;
@end
