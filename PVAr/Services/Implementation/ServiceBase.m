//
//  NSObject+ServiceBase.m
//  Alerta Si
//
//  Created by Huenei on 30/11/16.
//  Copyright © 2016 Huenei. All rights reserved.
//

#import "ServiceBase.h"
#import "AppDelegate.h"
#import "Constants.h"

@implementation ServiceBase

+(AFHTTPRequestSerializer<AFURLRequestSerialization> *)requestSerializer{
    
    //NSString *deviceID = [[SesionManager sharedInstance] deviceId];
    //NSString *apiKey = [[SesionManager sharedInstance] apiKey];
    //NSString *token = [[SesionManager sharedInstance] token];

    AFJSONRequestSerializer *requestSerializer = [AFJSONRequestSerializer serializer];
    
    [requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Content-type"];
    //[requestSerializer setValue:deviceID forHTTPHeaderField:DEVICE_KEY];
    //[requestSerializer setValue:apiKey forHTTPHeaderField:API_KEY];
    //[requestSerializer setValue:token forHTTPHeaderField:TOKEN_KEY];

    return requestSerializer;
}

-(void)postRequestWithParameters:(NSDictionary *)parameters action:(NSString *)action success:(RequestSuccessBlock)successBlock failure:(FailureBlock)failureBlock{
    self.actionName = action;
    self.methodType = @"POST";
    
    if([[AppDelegate sharedAppDelegate] checkNetworkAccess] == true){
        NSURL *URL = [NSURL URLWithString:[NSString stringWithFormat:@"%@<algo>",BaseURL]];
        
        AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
        manager.responseSerializer = [AFJSONResponseSerializer serializer];
        manager.securityPolicy.allowInvalidCertificates = YES;
        manager.securityPolicy.validatesDomainName = NO;
        
        [manager POST:URL.absoluteString parameters:parameters progress:^(NSProgress * _Nonnull uploadProgress) {
            
        } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            
        }];
    }else{
        NSDictionary *errorDic = @{ @"error" : @"Please, verify your internet access" };
        failureBlock([NSError errorWithDomain:@"Error_Internet"
                                         code:888
                                     userInfo:errorDic]);
    }
}

-(void)getRequestWithParameters:(NSDictionary *)parameters action:(NSString *)action success:(RequestSuccessBlock)successBlock failure:(FailureBlock)failureBlock{
    self.actionName = action;
    self.methodType = @"GET";
    
    if([[AppDelegate sharedAppDelegate] checkNetworkAccess] == true){
        NSURL *URL = [NSURL URLWithString:[NSString stringWithFormat:@"%@<algo>",BaseURL]];
        
        AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
        manager.responseSerializer = [AFJSONResponseSerializer serializer];
        manager.securityPolicy.allowInvalidCertificates = YES;
        manager.securityPolicy.validatesDomainName = NO;
        
        [manager GET:URL.absoluteString parameters:nil progress:nil success:^(NSURLSessionTask *task, id responseObject) {
            
            NSLog(@"JSON: %@", responseObject);
            successBlock(responseObject);
        } failure:^(NSURLSessionTask *operation, NSError *error) {
            NSLog(@"Error: %@", error);
            failureBlock(error);
        }];
    }else{
        NSDictionary *errorDic = @{ @"error" : @"Please, verify your internet access" };
        failureBlock([NSError errorWithDomain:@"Error_Internet"
                                         code:888
                                     userInfo:errorDic]);
    }
}

-(void)deleteRequestWithParameters:(NSDictionary *)parameters action:(NSString *)action success:(RequestSuccessBlock)successBlock failure:(FailureBlock)failureBlock{
    self.actionName = action;
    self.methodType = @"DELETE";
    
    if([[AppDelegate sharedAppDelegate] checkNetworkAccess] == true){
        NSURL *URL = [NSURL URLWithString:[NSString stringWithFormat:@"%@<algo>",BaseURL]];
        
        AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
        manager.responseSerializer = [AFJSONResponseSerializer serializer];
        manager.securityPolicy.allowInvalidCertificates = YES;
        manager.securityPolicy.validatesDomainName = NO;
        
        [manager DELETE:URL.absoluteString parameters:parameters success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            
            NSLog(@"JSON: %@", responseObject);
            successBlock(responseObject);
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            NSLog(@"Error: %@", error);
            failureBlock(error);
        }];
    }else{
        NSDictionary *errorDic = @{ @"error" : @"Please, verify your internet access" };
        failureBlock([NSError errorWithDomain:@"Error_Internet"
                                         code:888
                                     userInfo:errorDic]);
    }
}

-(void)putRequestWithParameters:(NSDictionary *)parameters action:(NSString *)action success:(RequestSuccessBlock)successBlock failure:(FailureBlock)failureBlock{
    self.actionName = action;
    self.methodType = @"PUT";
    
    if([[AppDelegate sharedAppDelegate] checkNetworkAccess] == true){
        NSURL *URL = [NSURL URLWithString:[NSString stringWithFormat:@"%@<algo>",BaseURL]];
        
        AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
        manager.responseSerializer = [AFJSONResponseSerializer serializer];
        manager.securityPolicy.allowInvalidCertificates = YES;
        manager.securityPolicy.validatesDomainName = NO;
        
        [manager PUT:URL.absoluteString parameters:parameters success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            
            NSLog(@"JSON: %@", responseObject);
            successBlock(responseObject);
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            NSLog(@"Error: %@", error);
            failureBlock(error);
        }];
    }else{
        NSDictionary *errorDic = @{ @"error" : @"Please, verify your internet access" };
        failureBlock([NSError errorWithDomain:@"Error_Internet"
                                         code:888
                                     userInfo:errorDic]);
    }
}

@end
