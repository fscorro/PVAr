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
    }
}

-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    if ([self.delegate respondsToSelector:@selector(delegateVC:option:)]) {
        [self.delegate delegateVC:self option:self.selectedOption];
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
    
    NSArray * auxArr = [[arrOptions objectAtIndex:indexPath.row] componentsSeparatedByString:@" - "];
    
    if([self.selectedOption isEqualToString:[auxArr objectAtIndex:0]]){
        cell.accessoryType = UITableViewCellAccessoryCheckmark;
        indexPathOld = indexPath;
    }else{
        cell.accessoryType = UITableViewCellAccessoryNone;
    }
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    selectedCell = [tableView cellForRowAtIndexPath:indexPath];
    
    if(![indexPathOld isEqual:indexPath]){
        UITableViewCell *aux = [tableView cellForRowAtIndexPath:indexPathOld];
        [tableView deselectRowAtIndexPath:indexPathOld animated:YES];
        aux.accessoryType = UITableViewCellAccessoryNone;

        indexPathOld = indexPath;
        
        selectedCell.accessoryType = UITableViewCellAccessoryCheckmark;

        NSArray *auxArr = [[arrOptions objectAtIndex:indexPath.row] componentsSeparatedByString:@" - "];

        self.selectedOption = [auxArr objectAtIndex:0];
    }
    
    [self.navigationController popViewControllerAnimated:YES];
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    // This will create a "invisible" footer
    return 0.01f;
}
- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    return [UIView new];
}

@end
