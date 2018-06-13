//
//  ServiceBlocks.h
//  PageViewDemo
//
//  Created by Pablo Medici on 15/7/16.
//  Copyright © 2016 Huenei. All rights reserved.
//

#ifndef ServiceBlocks_h
#define ServiceBlocks_h
typedef void (^SuccessBlock)(void);
typedef void (^SuccessArrayBlock)(NSArray *results);
typedef void (^RequestSuccessBlock)(id responseObject);
typedef void (^FailureBlock)(NSError* error);
#endif /* ServiceBlocks_h */
