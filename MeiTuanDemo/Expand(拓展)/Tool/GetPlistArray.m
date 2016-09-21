//
//  GetPlistArray.m
//  MeiTuanDemo
//
//  Created by saifing on 16/9/20.
//  Copyright © 2016年 baiyinxiao. All rights reserved.
//

#import "GetPlistArray.h"

@implementation GetPlistArray

+(NSArray *)arrayWithString:(NSString *)string{
    NSString *plistPath = [[NSBundle mainBundle]pathForResource:string ofType:nil];
    NSArray *array = [[NSArray alloc]initWithContentsOfFile:plistPath];
    return array;
    
}

@end
