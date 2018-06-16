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
    
    NSMutableDictionary *arrFlyInformation;;
    NSMutableDictionary *arrAeroplaneInformation;
    NSMutableDictionary *arrAerodromeInformation;
    NSMutableDictionary *arrdestinationInformation;

    NSDictionary *sections;
    NSArray *sectionTitles;
}
@end


@implementation FlyingPlanDetaillViewController

-(void)viewDidLoad{
    [super viewDidLoad];
    
    [self displayTableData];
}

-(void) displayTableData{
    
    arrFlyInformation = [[NSMutableDictionary alloc] init];
    [arrFlyInformation setValue:self.fly.number forKey:@"1Number"];
    [arrFlyInformation setValue:self.fly.priority forKey:@"2Priority"];
    [arrFlyInformation setValue:self.fly.enrollment forKey:@"3Enrollment"];
    [arrFlyInformation setValue:self.fly.company forKey:@"4Company"];
    [arrFlyInformation setValue:self.fly.rule forKey:@"5Rule"];
    [arrFlyInformation setValue:self.fly.type forKey:@"6Type"];

    arrAeroplaneInformation = [[NSMutableDictionary alloc] init];
    [arrAeroplaneInformation setValue:self.fly.aeroplaneNumber forKey:@"1Number"];
    [arrAeroplaneInformation setValue:self.fly.aeroplaneType forKey:@"2Type"];
    [arrAeroplaneInformation setValue:self.fly.category forKey:@"3Category"];
    [arrAeroplaneInformation setValue:self.fly.equipment forKey:@"4Equipment"];

    arrAerodromeInformation = [[NSMutableDictionary alloc] init];
    [arrAerodromeInformation setValue:self.fly.aerodrome forKey:@"1Aerodrome"];
    [arrAerodromeInformation setValue:self.fly.date forKey:@"2Date"];
    [arrAerodromeInformation setValue:self.fly.time forKey:@"3Time"];
    [arrAerodromeInformation setValue:self.fly.unit forKey:@"4Unit"];
    [arrAerodromeInformation setValue:self.fly.speed forKey:@"5Speed"];
    [arrAerodromeInformation setValue:self.fly.level forKey:@"6Level"];

    arrdestinationInformation = [[NSMutableDictionary alloc] init];
    [arrdestinationInformation setValue:self.fly.origin forKey:@"1Origin"];
    [arrdestinationInformation setValue:self.fly.destination forKey:@"2Destination"];
    [arrdestinationInformation setValue:self.fly.EET forKey:@"3Total EET"];
    [arrdestinationInformation setValue:self.fly.alternative forKey:@"4Alternative"];
    [arrdestinationInformation setValue:self.fly.information forKey:@"5Util Information"];

    sections = @{@"A" : arrFlyInformation,
                 @"B" : arrAeroplaneInformation,
                 @"C" : arrAerodromeInformation,
                 @"D" : arrdestinationInformation
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
    
    NSDictionary *aux = [[NSDictionary alloc] init];

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
    
    NSArray *arr = [[NSArray alloc] initWithArray:[self sortDictValues:aux]];

    [cell.textLabel setText:[self removeFirstCharFromString:[[aux allKeysForObject:[arr objectAtIndex:indexPath.row]] objectAtIndex:0]]];
    [cell.detailTextLabel setText:[arr objectAtIndex:indexPath.row]];
    
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

- (NSMutableArray *)sortDictValues:(NSDictionary *)dictionary {
    
    NSArray *keys = [dictionary allKeys];
    NSArray *sKeys = [keys sortedArrayUsingSelector:@selector(caseInsensitiveCompare:)];
    NSMutableArray *sValues = [[NSMutableArray alloc] init];
    
    for(id k in sKeys) {
        id val = [dictionary objectForKey:k];
        [sValues addObject:val];
    }
    return sValues;
}

-(NSString*)removeFirstCharFromString:(NSString*)str{
    NSString *newStr = [str substringWithRange:NSMakeRange(1, [str length]-1)];
    return newStr;
}
@end
