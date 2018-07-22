//
//  UIViewController+CustomSelectorViewController.m
//  PVAr
//
//  Created by Roberto Daviduk on 24/6/18.
//  Copyright © 2018 Prisma. All rights reserved.
//

#import "CustomSelectorViewController.h"
#import "Constants.h"
#import "Utils.h"

@interface CustomSelectorViewController(){
    NSArray *arrOptions;
    
    UITableViewCell *selectedCell;
    NSIndexPath *indexPathOld;
    
    BOOL isMultiValue;
}
@end

@implementation CustomSelectorViewController

-(void)viewDidLoad{
    [super viewDidLoad];
    
    if([self.tag isEqualToString:ModelFlyrule]){
        arrOptions = [[Utils sharedUtils] loadDataFromPlist:PlistSelectorValuesName withKey:PlistSelectorValuesKeyFlyRule];
    }else if([self.tag isEqualToString:ModelFlytype]){
        arrOptions = [[Utils sharedUtils] loadDataFromPlist:PlistSelectorValuesName withKey:PlistSelectorValuesKeyFlyType];
    }else if([self.tag isEqualToString:ModelFlycategory]){
        arrOptions = [[Utils sharedUtils] loadDataFromPlist:PlistSelectorValuesName withKey:PlistSelectorValuesKeyFlyCategory];
    }else if([self.tag isEqualToString:ModelFlyspeedUnit]){
        arrOptions = [[Utils sharedUtils] loadDataFromPlist:PlistSelectorValuesName withKey:PlistSelectorValuesKeyFlySpeed];
    }else if([self.tag isEqualToString:ModelFlylevelUnit]){
        arrOptions = [[Utils sharedUtils] loadDataFromPlist:PlistSelectorValuesName withKey:PlistSelectorValuesKeyFlyLevel];
    }else if([self.tag isEqualToString:ModelFlyRadiocomunication]){
        isMultiValue = true;
        arrOptions = [[Utils sharedUtils] loadDataFromPlist:PlistSelectorValuesName withKey:PlistSelectorValuesKeyFlyRadiocomunication];
    }else if([self.tag isEqualToString:ModelFlyVigilance]){
        isMultiValue = true;
        arrOptions = [[Utils sharedUtils] loadDataFromPlist:PlistSelectorValuesName withKey:PlistSelectorValuesKeyFlyVigilance];
    }else if([self.tag isEqualToString:ModelFlyEmergencyRadio]){
        isMultiValue = true;
        arrOptions = [[Utils sharedUtils] loadDataFromPlist:PlistSelectorValuesName withKey:PlistSelectorValuesKeyFlyEmergencyRadio];
    }else if([self.tag isEqualToString:ModelFlySurvivalEquipment]){
        isMultiValue = true;
        arrOptions = [[Utils sharedUtils] loadDataFromPlist:PlistSelectorValuesName withKey:PlistSelectorValuesKeyFlySurvivalEquipment];
    }else if([self.tag isEqualToString:ModelFlyJackets]){
        isMultiValue = true;
        arrOptions = [[Utils sharedUtils] loadDataFromPlist:PlistSelectorValuesName withKey:PlistSelectorValuesKeyFlyJackets];
    }
}

-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    if ([self.delegate respondsToSelector:@selector(delegateVC:option:)]) {
        NSMutableDictionary *dic = [[NSMutableDictionary alloc] init];
        if(isMultiValue){
            [dic setObject:self.selectedOptions forKey:@"selectedOptions"];
        }else{
            [dic setObject:self.selectedOption forKey:@"selectedOption"];
        }
        [self.delegate delegateVC:self option:dic];
    }
}

#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [arrOptions count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *cellID = @"CellCustomSelector";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    }
    
    cell.textLabel.text = [arrOptions objectAtIndex:indexPath.row];
    
    NSString *symbol = [[Utils sharedUtils] returnFirstWordFromString:[arrOptions objectAtIndex:indexPath.row]];

    if(isMultiValue){
        if([self.selectedOptions count] > 0){
            for (NSString *op in self.selectedOptions) {
                if([op isEqualToString:symbol]){
                    cell.accessoryType = UITableViewCellAccessoryCheckmark;
                    break;
                }else{
                    cell.accessoryType = UITableViewCellAccessoryNone;
                }
            }
        }else{
            cell.accessoryType = UITableViewCellAccessoryNone;
        }
    }else{
        if([self.selectedOption isEqualToString:symbol]){
            cell.accessoryType = UITableViewCellAccessoryCheckmark;
            indexPathOld = indexPath;
        }else{
            cell.accessoryType = UITableViewCellAccessoryNone;
        }
    }
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    selectedCell = [tableView cellForRowAtIndexPath:indexPath];
    
    if(isMultiValue == false){
        if(![indexPathOld isEqual:indexPath]){
            UITableViewCell *aux = [tableView cellForRowAtIndexPath:indexPathOld];
            [tableView deselectRowAtIndexPath:indexPathOld animated:YES];
            aux.accessoryType = UITableViewCellAccessoryNone;
            
            indexPathOld = indexPath;
            
            selectedCell.accessoryType = UITableViewCellAccessoryCheckmark;
            
            NSString *symbol = [[Utils sharedUtils] returnFirstWordFromString:[arrOptions objectAtIndex:indexPath.row]];

            self.selectedOption = symbol;
        }
        
        [self.navigationController popViewControllerAnimated:YES];
    }else{
        NSString *symbol = [[Utils sharedUtils] returnFirstWordFromString:[arrOptions objectAtIndex:indexPath.row]];

        if(selectedCell.accessoryType == UITableViewCellAccessoryNone){
            selectedCell.accessoryType = UITableViewCellAccessoryCheckmark;
            [self.selectedOptions addObject:symbol];
        }else{
            selectedCell.accessoryType = UITableViewCellAccessoryNone;
            [self.selectedOptions removeObject:symbol];
        }
        [tableView deselectRowAtIndexPath:indexPath animated:YES];
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    // This will create a "invisible" footer
    return 0.01f;
}
- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    return [UIView new];
}

@end
