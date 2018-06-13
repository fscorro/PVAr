//
//  NSObject+ServiceBase.h
//  Alerta Si
//
//  Created by Huenei on 30/11/16.
//  Copyright © 2016 Huenei. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AFNetworking/AFNetworking.h>
#import "ServiceBlocks.h"
#import "JSONServiceNamer.h"

#define BaseURL @""

@interface ServiceBase : NSObject

@property (nonatomic, strong) NSString *actionName;
@property (nonatomic, strong) NSString *methodType;

+ (AFHTTPRequestSerializer <AFURLRequestSerialization> *)requestSerializer;

-(void)postRequestWithParameters:(NSDictionary*)parameters action:(NSString*)action success:(RequestSuccessBlock)successBlock failure:(FailureBlock)failureBlock;

-(void)getRequestWithParameters:(NSDictionary*)parameters action:(NSString*)action success:(RequestSuccessBlock)successBlock failure:(FailureBlock)failureBlock;

-(void)deleteRequestWithParameters:(NSDictionary*)parameters action:(NSString*)action success:(RequestSuccessBlock)successBlock failure:(FailureBlock)failureBlock;

-(void)putRequestWithParameters:(NSDictionary*)parameters action:(NSString*)action success:(RequestSuccessBlock)successBlock failure:(FailureBlock)failureBlock;

@end
