//
//  JBNetwork.h
//  MeiTuanDemo
//
//  Created by saifing on 16/9/22.
//  Copyright © 2016年 baiyinxiao. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MKNetworkKit.h>

#import "JBrequestModel.h"
#import "HTTPURLDefine.h"

typedef void(^SuccessBlock)(id Json);
typedef void(^FailureBlock)(NSString *error);

typedef NS_ENUM(NSInteger, resquestMethod) {
    //get请求
    GET = 0,
    
    //post请求
    POST,
};

@interface JBNetwork : NSObject

SingletonH(Instance);

/**
 *  get请求
 *
 *  @param url          服务器地址
 *  @param requestModel 请求参数
 *  @param success      成功回调
 *  @param failure      失败回调
 */
- (void)getWithRequestModel:(JBrequestModel *)requestModel
           success:(SuccessBlock)success
           failure:(FailureBlock)failure;


/**
 *  post请求
 *
 *  @param url          服务器地址
 *  @param requestModel 请求参数
 *  @param success      成功回调
 *  @param failure      失败回调
 */
- (void)postWithRequestModel:(JBrequestModel *)requestModel
           success:(SuccessBlock)success
           failure:(FailureBlock)failure;
/**
 *  网络请求(POST/GET)
 *
 *  @param url            服务器地址
 *  @param resquestMethod 请求方式
 *  @param requestModel   请求参数
 *  @param success        成功回调
 *  @param failure        失败回调
 */
- (void)resquestWithRequestModel:(JBrequestModel *)requestModel
         resquestMethod:(resquestMethod)resquestMethod
            success:(SuccessBlock)success
            failure:(FailureBlock)failure;

@end
