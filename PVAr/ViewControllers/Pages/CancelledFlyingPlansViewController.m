//
//  UIViewController+CancelledFlyingPlansViewController.m
//  PVAr
//
//  Created by Prisma on 13/6/18.
//  Copyright © 2018 Prisma. All rights reserved.
//

#import "CancelledFlyingPlansViewController.h"
#import "CellFlyingPlan.h"
#import "Constants.h"
#import "Fly.h"
#import "FlyingPlanDetaillViewController.h"

@interface CancelledFlyingPlansViewController (){
    NSMutableArray *arr;
    Fly *selectedFly;
}

@end

@implementation CancelledFlyingPlansViewController

-(void)viewDidLoad{
    [super viewDidLoad];
    
    arr = [[NSMutableArray alloc] init];

    if ([arr count] > 0) {
        [self.viewEmptyMessage setHidden:true];
        [self.tableviewCancelledFlying reloadData];
    }else{
        [self.viewEmptyMessage setHidden:false];
        [self.tableviewCancelledFlying setHidden:true];
    }
}

#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [arr count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    CellFlyingPlan *cell = (CellFlyingPlan *)[tableView dequeueReusableCellWithIdentifier:@"CellFlyingPlan"];
    if(cell == nil){
        [tableView registerNib:[UINib nibWithNibName:@"CellFlyingPlan" bundle:nil] forCellReuseIdentifier:@"CellFlyingPlan"];
        cell = [tableView dequeueReusableCellWithIdentifier:@"CellFlyingPlan"];
    }
    [cell configureWithFly:[arr objectAtIndex:indexPath.row]];
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    selectedFly = [arr objectAtIndex:indexPath.row];
    
    [self performSegueWithIdentifier:SegueFlyingPlanDetail sender:nil];
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    // This will create a "invisible" footer
    return 0.01f;
}
- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    return [UIView new];
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 150.0f;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    NSString *segueId = segue.identifier;
    
    if ([segueId isEqualToString:SegueFlyingPlanDetail]) {
        FlyingPlanDetaillViewController *vc = segue.destinationViewController;
        vc.fly = selectedFly;
    }
}

@end
