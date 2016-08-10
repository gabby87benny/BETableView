//
//  Person.m
//  BETableView
//
//  Created by Gabriel Benny on 12/30/15.
//  Copyright © 2015 Gabriel Benny. All rights reserved.
//

#import "Person.h"

@implementation Person

+(instancetype)initWithName:(NSString *)name company:(NSString *)cmpny {
    Person *person = [Person new];
    person.name = name;
    person.company = cmpny;
    return person;
}

+(NSArray *)personsData {
    return @[[Person initWithName:@"gabriel" company:@"A"],[Person initWithName:@"benny" company:@"B"],[Person initWithName:@"francis" company:@"C"],[Person initWithName:@"jeffrey" company:@"D"],[Person initWithName:@"xavier" company:@"E"]];
}

@end
