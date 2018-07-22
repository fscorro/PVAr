//
//  Constants.h
//  PVAr
//
//  Created by Prisma on 12/6/18.
//  Copyright © 2018 Prisma. All rights reserved.
//

#ifndef Constants_h
#define Constants_h

#define AppColorLight [UIColor colorWithRed:(0/255.0) green:(59/255.0) blue:(104/255.0) alpha:1]
#define AppColorMid [UIColor colorWithRed:(0/255.0) green:(49/255.0) blue:(94/255.0) alpha:1]
#define AppColorDark [UIColor colorWithRed:(0/255.0) green:(39/255.0) blue:(84/255.0) alpha:1]

#define FlyStatePendingColor [UIColor colorWithRed:(255/255.0) green:(235/255.0) blue:(59/255.0) alpha:1]
#define FlyStateAcceptedColor [UIColor colorWithRed:(56/255.0) green:(142/255.0) blue:(60/255.0) alpha:1]
#define FlyStateCancelledColor [UIColor colorWithRed:(211/255.0) green:(47/255.0) blue:(47/255.0) alpha:1]

#define AlertColorError [UIColor colorWithRed:(183/255.0) green:(28/255.0) blue:(28/255.0) alpha:1]
#define AlertColorSuccess [UIColor colorWithRed:(27/255.0) green:(94/255.0) blue:(32/255.0) alpha:1]
#define CellSelectedColor [UIColor colorWithRed:(0/255.0) green:(47/255.0) blue:(102/255.0) alpha:0.45f]

#define DateFormat @"MMM d, yyyy"
#define TimeFormat @"HH:mm a"
#define TimeFormatPicker @"HH:mm"

#define ModelUserEmailKEY @"email"
#define ModelUserPasswordKEY @"password"
#define ModelUserRepeatPasswordKEY @"repeatPassword"

#define ModelFlystate @"state"
#define ModelFlyCreationType @"creationType"
#define ModelFlyaeroplaneID @"aeroplaneID"
#define ModelFlyrule @"rule"
#define ModelFlytype @"type"
#define ModelFlyaeroplaneNumber @"aeroplaneNumber"
#define ModelFlyaeroplaneType @"aeroplaneType"
#define ModelFlycategory @"category"
#define ModelFlyequipment @"equipment"
#define ModelFlyHasRadiocomunication @"hasRadiocomunication"
#define ModelFlyRadiocomunication @"radiocomunication"
#define ModelFlyhasVigilance @"hasVigilance"
#define ModelFlyVigilance @"vigilance"
#define ModelFlydateTime @"dateTime"
#define ModelFlyunit @"unit"
#define ModelFlyspeedUnit @"speedUnit"
#define ModelFlyspeed @"speed"
#define ModelFlylevelUnit @"levelUnit"
#define ModelFlylevel @"level"
#define ModelFlyroute @"route"
#define ModelFlyoriginAerodrome @"originAerodrome"
#define ModelFlydestinationAerodrome @"destinationAerodrome"
#define ModelFlyEET @"EET"
#define ModelFlyalternative @"alternative"
#define ModelFlyinformation @"information"

#define ModelFlySupplementaryDictionary @"supplementary"
#define ModelFlyEndurance @"endurance"
#define ModelFlyPersonsOnBoard @"personsOnBoard"
#define ModelFlyHasEmergencyRadio @"hasEmergencyRadio"
#define ModelFlyEmergencyRadio @"emergencyRadio"
#define ModelFlyHasSurvivalEquipment @"hasSurvivalEquipment"
#define ModelFlySurvivalEquipment @"survivalEquipment"
#define ModelFlyHasJackets @"hasJackets"
#define ModelFlyJackets @"jackets"
#define ModelFlyDinghies @"dinghies"
#define ModelFlyDinghiesNumber @"dinghiesNumber"
#define ModelFlyDinghiesCapacity @"dinghiesCapacity"
#define ModelFlyDinghiesHasCover @"dinghiesHasColor"
#define ModelFlyDinghiesCoverColor @"dinghiesCoverColor"
#define ModelFlyAircraftColor @"aircraftColor"
#define ModelFlyHasRemakrs @"hasRemarks"
#define ModelFlyRemakrs @"remarks"
#define ModelFlyPilotInCommand @"pilotInCommand"
#define ModelFlyPilotLicence @"pilotLicence"
#define ModelFlyAditionalRequirements @"aditionalRequirements"

#define PlistSelectorValuesName @"SelectorValues"
#define PlistSelectorValuesKeyFlyRule @"Rule"
#define PlistSelectorValuesKeyFlyType @"Type"
#define PlistSelectorValuesKeyFlyCategory @"Category"
#define PlistSelectorValuesKeyFlySpeed @"Speed"
#define PlistSelectorValuesKeyFlyLevel @"Level"
#define PlistSelectorValuesKeyFlyRadiocomunication @"Radiocomunication"
#define PlistSelectorValuesKeyFlyVigilance @"Vigilance"
#define PlistSelectorValuesKeyFlyEmergencyRadio @"EmergencyRadio"
#define PlistSelectorValuesKeyFlySurvivalEquipment @"SurvivalEquipment"
#define PlistSelectorValuesKeyFlyJackets @"Jackets"

#define SegueFlyingPlanDetail @"SegueFlyingPlanDetail"

#define ValidationPlaceholderRequiered @"Requiered..."

// Forms Constants values
#define KButtonCreateFPL @"KButtonCreateFPL"
#define maxAlternativesDestination 2

#endif /* Constants_h */
