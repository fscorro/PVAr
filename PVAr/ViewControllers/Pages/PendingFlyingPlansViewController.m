//
//  UIViewController+PendingFlyingPlansViewController.m
//  PVAr
//
//  Created by Prisma on 13/6/18.
//  Copyright © 2018 Prisma. All rights reserved.
//

#import "PendingFlyingPlansViewController.h"
#import "CellFlyingPlan.h"
#import "Constants.h"

@interface PendingFlyingPlansViewController (){
    NSMutableArray *arr;
//    Chat *selectedChat;
}

@end

@implementation PendingFlyingPlansViewController

-(void)viewDidLoad{
    [super viewDidLoad];
    
}


#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 2;//[arr count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    CellFlyingPlan *cell = (CellFlyingPlan *)[tableView dequeueReusableCellWithIdentifier:@"CellFlyingPlan"];
    if(cell == nil){
        [tableView registerNib:[UINib nibWithNibName:@"CellFlyingPlan" bundle:nil] forCellReuseIdentifier:@"CellFlyingPlan"];
        cell = [tableView dequeueReusableCellWithIdentifier:@"CellFlyingPlan"];
    }
    [cell configureViews];
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
//    selectedChat = [arr objectAtIndex:indexPath.row];
    [self performSegueWithIdentifier:@"SegueFlyingPlanDetail" sender:nil];
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
@end
