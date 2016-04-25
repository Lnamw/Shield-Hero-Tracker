//
//  HeroDetailViewController.h
//  Shield Hero Tracker
//
//  Created by Elena Maso Willen on 25/04/2016.
//  Copyright © 2016 Training. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Hero; //just to let to know there is a class name Hero but nothing more important

@interface HeroDetailViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *homeWorldLabel;
@property (weak, nonatomic) IBOutlet UILabel *powersLabel;

@property (strong, nonatomic) Hero *holdingHero;
@end
