//
//  UIViewController+FlyingPlanDetaillViewController.m
//  PVAr
//
//  Created by Prisma on 14/6/18.
//  Copyright © 2018 Prisma. All rights reserved.
//

#import "FlyingPlanDetaillViewController.h"
#import "FlyDetailForm.h"
#import "Constants.h"
#import "ShowAlert.h"
#import "Fly.h"

@interface FlyingPlanDetaillViewController(){
    
    NSArray *arrFlyInformation;;
    NSArray *arrAeroplaneInformation;
    NSArray *arrAerodromeInformation;
    NSArray *arrdestinationInformation;

    NSDictionary *sections;
    NSArray *sectionTitles;
    
    NSMutableDictionary *dictFlyDetail;
}
@end


@implementation FlyingPlanDetaillViewController

-(void)viewDidLoad{
    [super viewDidLoad];
    
    dictFlyDetail = [[NSMutableDictionary alloc] init];
    [dictFlyDetail setValue:@"AAA" forKey:ModelFlynumber];
    [dictFlyDetail setValue:@"SSS" forKey:ModelFlypriority];
    [dictFlyDetail setValue:@"DDD" forKey:ModelFlyenrollment];
    [dictFlyDetail setValue:@"EEE" forKey:ModelFlycompany];
    [dictFlyDetail setValue:@"WWW" forKey:ModelFlyrule];
    [dictFlyDetail setValue:@"QQQ" forKey:ModelFlytype];
    
    [dictFlyDetail setValue:@"ZZZ" forKey:ModelFlyaeroplaneNumber];
    [dictFlyDetail setValue:@"XXX" forKey:ModelFlyaeroplaneType];
    [dictFlyDetail setValue:@"CCC" forKey:ModelFlycategory];
    [dictFlyDetail setValue:@"VVV" forKey:ModelFlyequipment];
    
    [dictFlyDetail setValue:@"RRR" forKey:ModelFlyaerodrome];
    [dictFlyDetail setValue:@"FFF" forKey:ModelFlydate];
    [dictFlyDetail setValue:@"VVV" forKey:ModelFlytime];
    [dictFlyDetail setValue:@"YYY" forKey:ModelFlyunit];
    [dictFlyDetail setValue:@"UUU" forKey:ModelFlyspeed];
    [dictFlyDetail setValue:@"HHH" forKey:ModelFlylevel];
    
    [dictFlyDetail setValue:@"III" forKey:ModelFlyorigin];
    [dictFlyDetail setValue:@"OOO" forKey:ModelFlydestination];
    [dictFlyDetail setValue:@"LLL" forKey:ModelFlyEET];
    [dictFlyDetail setValue:@"ÑÑÑ" forKey:ModelFlyalternative];
    [dictFlyDetail setValue:@"MMM" forKey:ModelFlyinformation];
    
    self.fly = [[Fly alloc] initWithDict:dictFlyDetail];

    [self displayTableData];

}

-(void) displayTableData{
    
    arrFlyInformation = @[[dictFlyDetail valueForKey:ModelFlynumber],
                          [dictFlyDetail valueForKey:ModelFlypriority],
                          [dictFlyDetail valueForKey:ModelFlyenrollment],
                          [dictFlyDetail valueForKey:ModelFlycompany],
                          [dictFlyDetail valueForKey:ModelFlyrule],
                          [dictFlyDetail valueForKey:ModelFlytype]];
    
    arrAeroplaneInformation = @[[dictFlyDetail valueForKey:ModelFlyaeroplaneNumber],
                                [dictFlyDetail valueForKey:ModelFlyaeroplaneType],
                                [dictFlyDetail valueForKey:ModelFlycategory],
                                [dictFlyDetail valueForKey:ModelFlyequipment]];
    
    arrAerodromeInformation = @[[dictFlyDetail valueForKey:ModelFlyaerodrome],
                                [dictFlyDetail valueForKey:ModelFlydate],
                                [dictFlyDetail valueForKey:ModelFlytime],
                                [dictFlyDetail valueForKey:ModelFlyunit],
                                [dictFlyDetail valueForKey:ModelFlyspeed],
                                [dictFlyDetail valueForKey:ModelFlylevel]];
    
    arrAeroplaneInformation = @[[dictFlyDetail valueForKey:ModelFlyorigin],
                                [dictFlyDetail valueForKey:ModelFlydestination],
                                [dictFlyDetail valueForKey:ModelFlyEET],
                                [dictFlyDetail valueForKey:ModelFlyalternative],
                                [dictFlyDetail valueForKey:ModelFlyinformation]];
    
    sections = @{@"A" : arrFlyInformation,
                 @"B" : arrAeroplaneInformation,
                 @"C" : arrAerodromeInformation,
                 @"D" : arrAeroplaneInformation
                 };
    sectionTitles = [sections allKeys];
    
    [self.FlyDetailTableview reloadData];
}

#pragma mark - Sections
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return [sectionTitles count];
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    switch (section) {
        case 0:
            return @"FLY INFORMATION";
            break;
        case 1:
            return @"AEROPLANE INFORMATION";
            break;
        case 2:
            return @" ";
            break;
        case 3:
            return @" ";
            break;
    }
    return @"";
}

//- (void)tableView:(UITableView *)tableView willDisplayHeaderView:(UIView *)view forSection:(NSInteger)section{
//    // Set the text color of our header/footer text.
//    UITableViewHeaderFooterView *header = (UITableViewHeaderFooterView *)view;
//    [header.textLabel setTextColor:[UIColor whiteColor]];
//
//    // Set the background color of our header/footer.
//    header.contentView.backgroundColor = [UIColor groupTableViewBackgroundColor];
//
//    // You can also do this to set the background color of our header/footer,
//    //    but the gradients/other effects will be retained.
//    // view.tintColor = [UIColor blackColor];
//}

#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    switch (section) {
        case 0:
            return 6;
            break;
        case 1:
            return 4;
            break;
        case 2:
            return 6;
            break;
        case 3:
            return 5;
            break;
    }
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *MyIdentifier = @"CellFlyDetail";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:MyIdentifier];
    
    if (cell == nil){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:MyIdentifier];
    }
    
    NSArray *aux = [[NSArray alloc] init];

    switch (indexPath.section) {
        case 0:
            aux = [sections objectForKey:@"A"];
            break;
        case 1:
            aux = [sections objectForKey:@"B"];
            break;
        case 2:
            aux = [sections objectForKey:@"C"];
            break;
        case 3:
            aux = [sections objectForKey:@"D"];
            break;
    }
    
    [cell.textLabel setText:@""];
    [cell.detailTextLabel setText:[aux objectAtIndex:indexPath.row]];
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    // This will create a "invisible" footer
    return 0.01f;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    return [UIView new];
}


@end
