//
//  Hero.m
//  Shield Hero Tracker
//
//  Created by Elena Maso Willen on 25/04/2016.
//  Copyright © 2016 Training. All rights reserved.
//

#import "Hero.h"

@implementation Hero

-(instancetype)initWithName:(NSString *)name withHomeWorld:(NSString *)homeWorls withPowers:(NSString *)powers
{
    if (self = [super init]) {
        _name = name;
        _homeWorld = homeWorls;
        _powers = powers;
    }
    return self;
}


@end
