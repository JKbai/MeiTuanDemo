//
//  JBrequestModel.h
//  MeiTuanDemo
//
//  Created by saifing on 16/9/23.
//  Copyright © 2016年 baiyinxiao. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JBrequestModel : NSObject

/**
 *  请求地址
 */
@property (nonatomic, copy) NSString *hostName;

/**
 *  请求路径
 */
@property (nonatomic, copy) NSString *path;

/**
 *  请求类型
 */
@property (nonatomic, copy) NSString *type;

/**
 *  请求参数
 */
@property (nonatomic, strong) NSDictionary *params;
@end
