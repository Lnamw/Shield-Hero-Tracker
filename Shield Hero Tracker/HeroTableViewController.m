//
//  HeroTableViewController.m
//  Shield Hero Tracker
//
//  Created by Elena Maso Willen on 25/04/2016.
//  Copyright © 2016 Training. All rights reserved.
//

#import "HeroTableViewController.h"
#import "Hero.h"
#import "HeroDetailViewController.h"

@interface HeroTableViewController ()

@property(nonatomic, strong)NSMutableArray *heroes;

@end

@implementation HeroTableViewController

-(void)loadHeroes {
    
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"heroes" ofType:@"json"];
    NSArray *heroList = [NSJSONSerialization JSONObjectWithData:[NSData dataWithContentsOfFile:filePath] options:NSJSONReadingAllowFragments error:nil];  //NSJSONSerialization
    
    for (NSDictionary *dict in heroList) {
        
//        Hero * newHero = [[Hero alloc]init];
//        newHero.name = dict[@"name"];  // or: newHero.name = [dict objectForKey:@"name"];
//        newHero.homeWorld = dict[@"homeworld"];
//        newHero.powers = dict[@"powers"];
        Hero *newHero = [[Hero alloc] initWithName:dict[@"name"] withHomeWorld:dict[@"homeworld"] withPowers:dict[@"powers"]];
        
        [self.heroes addObject:newHero];
    }
    
//Others ways to do Loop:
//    for (int i=0; i < heroList.count; i++) {
//        <#statements#>
//    }
//    [heroList enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
//        <#code#>
//    }];
    
    // sort the array:
    NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"name" ascending:YES];
    [self.heroes sortUsingDescriptors:[NSArray arrayWithObject:sortDescriptor]];
    
    [self.tableView reloadData];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //Setup
    self.title = @"S.H.I.E.L.D Hero tracker";
    
    [self loadHeroes];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}


#pragma mark - Accessors  //You can instantiate outside the viewdidload like this

-(NSMutableArray *)heroes {
    if (_heroes == nil) {
        _heroes = [[NSMutableArray alloc] initWithCapacity:10];
    }
    return  _heroes;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.heroes.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"HeroCell" forIndexPath:indexPath];
    
    // Configure the cell...
    
    Hero *hero = self.heroes[indexPath.row];
    cell.textLabel.text = hero.name;
    cell.detailTextLabel.text = hero.homeWorld;
    
    
    
    return cell;
}

#pragma mark - TableView Delegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {

    [self performSegueWithIdentifier:@"ShowDetailSegue" sender:nil];

}

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
 
    if ([segue.identifier isEqualToString: @"ShowDetailSegue"] ) {
        HeroDetailViewController *vc = (HeroDetailViewController *)[segue destinationViewController];
        NSIndexPath *newPath =[self.tableView indexPathForSelectedRow];
        Hero *anotherHero = self.heroes[newPath.row];
        vc.holdingHero = anotherHero;
    }

}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/





@end
