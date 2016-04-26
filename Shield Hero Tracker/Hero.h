//
//  Hero.h
//  Shield Hero Tracker
//
//  Created by Elena Maso Willen on 25/04/2016.
//  Copyright © 2016 Training. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Hero : NSObject

@property (nonatomic, copy, readonly)NSString *name;
@property (nonatomic, copy, readonly)NSString *homeWorld;
@property (nonatomic, copy, readonly)NSString *powers;

-(instancetype)initWithName:(NSString *)name withHomeWorld:(NSString *)homeWorls withPowers:(NSString *)powers;

@end
