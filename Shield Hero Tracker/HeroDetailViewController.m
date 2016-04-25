//
//  HeroDetailViewController.m
//  Shield Hero Tracker
//
//  Created by Elena Maso Willen on 25/04/2016.
//  Copyright © 2016 Training. All rights reserved.
//

#import "HeroDetailViewController.h"
#import "Hero.h"

@interface HeroDetailViewController ()

@end

@implementation HeroDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.nameLabel.text = self.holdingHero.name;
    self.homeWorldLabel.text = self.holdingHero.homeWorld;
    self.powersLabel.text = self.holdingHero.powers;

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
