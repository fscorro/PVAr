//
//  UIViewController+AcceptedFlyingPlansViewController.m
//  PVAr
//
//  Created by Prisma on 13/6/18.
//  Copyright © 2018 Prisma. All rights reserved.
//

#import "AcceptedFlyingPlansViewController.h"
#import "CellFlyingPlan.h"
#import "Constants.h"
#import "Fly.h"
#import "FlyingPlanDetaillViewController.h"

@interface AcceptedFlyingPlansViewController (){
    NSMutableArray *arr;
    Fly *selectedFly;
}

@end

@implementation AcceptedFlyingPlansViewController

-(void)viewDidLoad{
    [super viewDidLoad];
    
    // todo esto deberia desaparecer, es solo para una demo..
    NSMutableDictionary *temp = [[NSMutableDictionary alloc] init];
    [temp setValue:@"A" forKey:ModelFlystate];
    
    [temp setValue:@"L597AA0" forKey:ModelFlyaeroplaneID];
    [temp setValue:@"V" forKey:ModelFlyrule];
    [temp setValue:@"N" forKey:ModelFlytype];
    
    [temp setValue:@"F5" forKey:ModelFlyaeroplaneNumber];
    [temp setValue:@"B763" forKey:ModelFlyaeroplaneType];
    [temp setValue:@"L" forKey:ModelFlycategory];
    [temp setValue:@"SDFGHIRWXYZ H" forKey:ModelFlyequipment];
    
    [temp setValue:@"EJOA" forKey:ModelFlyoriginAerodrome];
    [temp setValue:@"JKLM" forKey:ModelFlydestinationAerodrome];
    [temp setValue:[NSDate new] forKey:ModelFlydateTime];
    [temp setValue:@"K" forKey:ModelFlyunit];
    [temp setValue:@"N370" forKey:ModelFlyspeed];
    [temp setValue:@"F280" forKey:ModelFlylevel];
    
    [temp setValue:@"0313" forKey:ModelFlyEET];
    [temp setValue:@"Z1P1H W44" forKey:ModelFlyinformation];
    
    
    NSMutableDictionary *dicSupp = [[NSMutableDictionary alloc] init];
    [dicSupp setValue:@"Roberto Daviduk" forKey:ModelFlyPilotInCommand];
    [dicSupp setValue:@"M257-OKO" forKey:ModelFlyPilotLicence];
    
    [temp setValue:dicSupp forKey:ModelFlySupplementaryDictionary];
    
    Fly *fly = [[Fly alloc] initWithDict:temp];
    arr = [[NSMutableArray alloc] init];
    
    [arr addObject:fly];
    
    if ([arr count] > 0) {
        [self.viewEmptyMessage setHidden:true];
        [self.tableviewAcceptedFlying setHidden:false];
        [self.tableviewAcceptedFlying reloadData];
    }else{
        [self.viewEmptyMessage setHidden:false];
        [self.tableviewAcceptedFlying setHidden:true];
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
    UILongPressGestureRecognizer *longPress = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(handleCellLongPress:)];
    [cell addGestureRecognizer:longPress];
    
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

-(void) handleCellLongPress:(UIGestureRecognizer *)longPress {
    if (longPress.state==UIGestureRecognizerStateBegan) {
        CGPoint point = [longPress locationInView:self.tableviewAcceptedFlying];
        NSIndexPath *indexPath = [self.tableviewAcceptedFlying indexPathForRowAtPoint:point];
        NSLog(@"Holding Cell Indexpath %@",indexPath);
        
        UIAlertController *actionSheet = [UIAlertController alertControllerWithTitle:@"Options:" message:nil preferredStyle:UIAlertControllerStyleActionSheet];
        
        [actionSheet addAction:[UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleCancel handler:^(UIAlertAction *action) {
            
        }]];
        
        [actionSheet addAction:[UIAlertAction actionWithTitle:@"Add as favorite" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
            
            
        }]];
        
        [actionSheet addAction:[UIAlertAction actionWithTitle:@"Clone" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
            
            
        }]];
        
        [self presentViewController:actionSheet animated:YES completion:nil];
    }
}
@end
