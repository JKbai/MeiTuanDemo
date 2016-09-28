//
//  JBNetwork.m
//  MeiTuanDemo
//
//  Created by saifing on 16/9/22.
//  Copyright © 2016年 baiyinxiao. All rights reserved.
//

#import "JBNetwork.h"

#define ClientName @"textName.p12"
#define ClientPassword @"textPassword"

@implementation JBNetwork

SingletonM(Instance)

- (void)getWithRequestModel:(JBrequestModel *)requestModel success:(SuccessBlock)success failure:(FailureBlock)failure {
    
    MKNetworkEngine *engine = [[MKNetworkEngine alloc]initWithHostName:requestModel.hostName];
    MKNetworkOperation *op = [engine operationWithPath:requestModel.path params:requestModel.params httpMethod:@"GET" ssl:NO];
    
    //传Json
    op.postDataEncoding = MKNKPostDataEncodingTypeJSON;
    //boundle路径下的字签证书
    op.clientCertificate = [[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:ClientName];
    //字签证书的密码
    op.clientCertificatePassword = ClientPassword;
    //子签证书是需要忽略的,设置为YES,标识允许
    op.shouldContinueWithInvalidCertificate = YES;
    
    [op addCompletionHandler:^(MKNetworkOperation *completedOperation) {
        if (completedOperation.responseJSON) {
            success(completedOperation.responseJSON);
        }
    } errorHandler:^(MKNetworkOperation *completedOperation, NSError *error) {
        failure(error.description);
    }];

}

- (void)postWithRequestModel:(JBrequestModel *)requestModel success:(SuccessBlock)success failure:(FailureBlock)failure {
    
    MKNetworkEngine *engine = [[MKNetworkEngine alloc]initWithHostName:requestModel.hostName];
    MKNetworkOperation *op = [engine operationWithPath:requestModel.path params:requestModel.params httpMethod:@"POST" ssl:NO];
    
    //传Json
    op.postDataEncoding = MKNKPostDataEncodingTypeJSON;
    //boundle路径下的字签证书
    op.clientCertificate = [[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:ClientName];
    //字签证书的密码
    op.clientCertificatePassword = ClientPassword;
    //子签证书是需要忽略的,设置为YES,标识允许
    op.shouldContinueWithInvalidCertificate = YES;
    
    [op addCompletionHandler:^(MKNetworkOperation *completedOperation) {
        if (completedOperation.responseJSON) {
            success(completedOperation.responseJSON);
        }
    } errorHandler:^(MKNetworkOperation *completedOperation, NSError *error) {
        failure(error.description);
    }];
}

- (void)resquestWithRequestModel:(JBrequestModel *)requestModel resquestMethod:(resquestMethod)resquestMethod  success:(SuccessBlock)success failure:(FailureBlock)failure {
    
    MKNetworkEngine *engine = [[MKNetworkEngine alloc]initWithHostName:requestModel.hostName];
    switch (resquestMethod) {
        case GET:
        {
            MKNetworkOperation *op = [engine operationWithPath:requestModel.path params:requestModel.params httpMethod:@"GET" ssl:NO];
            
            //传Json
            op.postDataEncoding = MKNKPostDataEncodingTypeJSON;
            //boundle路径下的字签证书
            op.clientCertificate = [[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:ClientName];
            //字签证书的密码
            op.clientCertificatePassword = ClientPassword;
            //子签证书是需要忽略的,设置为YES,标识允许
            op.shouldContinueWithInvalidCertificate = YES;
            
            [op addCompletionHandler:^(MKNetworkOperation *completedOperation) {
                if (completedOperation.responseJSON) {
                    success(completedOperation.responseJSON);
                }
            } errorHandler:^(MKNetworkOperation *completedOperation, NSError *error) {
                failure(error.description);
            }];

            
        }
            break;
        case POST:
        {
            MKNetworkOperation *op = [engine operationWithPath:requestModel.path params:requestModel.params httpMethod:@"POST" ssl:NO];
            
            //传Json
            op.postDataEncoding = MKNKPostDataEncodingTypeJSON;
            //boundle路径下的字签证书
            op.clientCertificate = [[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:ClientName];
            //字签证书的密码
            op.clientCertificatePassword = ClientPassword;
            //子签证书是需要忽略的,设置为YES,标识允许
            op.shouldContinueWithInvalidCertificate = YES;
            
            [op addCompletionHandler:^(MKNetworkOperation *completedOperation) {
                if (completedOperation.responseJSON) {
                    success(completedOperation.responseJSON);
                }
            } errorHandler:^(MKNetworkOperation *completedOperation, NSError *error) {
                failure(error.description);
            }];

        }
            break;
            
        default:
            break;
    }
    
    
}

@end
