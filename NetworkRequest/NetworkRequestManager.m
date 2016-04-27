//
//  NetworkRequestManager.m
//  NetworkRequest
//
//  Created by lanouhn on 16/4/26.
//  Copyright © 2016年 王国军. All rights reserved.
//

#import "NetworkRequestManager.h"

@implementation NetworkRequestManager

//GET 方法
+ (void)requestWithGetUrl:(NSString *)url Pardic:(NSDictionary *)pardic success:(__autoreleasing RequestFinish)success err:(__autoreleasing RequestError )err {
    
    [NetworkRequestManager requestWithType:GET urlString:url Pardic:pardic success:success err:err];
}

//POST 方法
+ (void)requestWithPostUrl:(NSString *)url Pardic:(NSDictionary *)pardic success:(__autoreleasing RequestFinish)success err:(__autoreleasing RequestError)err {
    [NetworkRequestManager requestWithType:POST urlString:url Pardic:pardic success:success err:err];
}




//请求数据
+ (void)requestWithType:(NSInteger)type urlString:(NSString *)urlString Pardic:(NSDictionary *)pardic success:(RequestFinish)success err:(RequestError)err {
    NSURL *url = [NSURL URLWithString:urlString];
    NSMutableURLRequest *mRequest = [NSMutableURLRequest requestWithURL:url];
    if (type == POST) {
        if (pardic) {
            mRequest.HTTPMethod = @"POST";
            mRequest.HTTPBody = [NSJSONSerialization dataWithJSONObject:pardic options:0 error:nil];
        }
    }
    
    NSURLSession *session = [NSURLSession sharedSession];
    NSURLSessionDataTask *dataTask = [session dataTaskWithRequest:mRequest completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (!error) {
            id tem = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
            success(tem);
        } else {
            err(error);
        }
    }];
    [dataTask resume];
}

//注意!!!!!
//用于处理GET请求返回的数据  直接是html格式....
//将html处理成字符串进行返回.
//+ (void)requestGetWithUrlString:(NSString *)urlString
//                   successBlock:(void(^)(id responseObject))success
//                    filureBlock:(void(^)(NSError *error))conerror {
//    //创建全局会话
//    NSURLSession *session = [NSURLSession sharedSession];
//    //根据全局对话创建请求任务对象
//    NSURLSessionDataTask *dataTask = [session dataTaskWithURL:[NSURL URLWithString:urlString] completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
//        if (!error) {
//            id tempString = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
//            success(tempString);
//        } else {
//            conerror(error);
//        }
//    }];
//    
//    //开启任务
//    [dataTask resume];
//}

+ (void)requestWithGetUrl:(NSString *)urlstr success:(RequestFinish)success err:(RequestError)err {
    NSURL *url = [NSURL URLWithString:urlstr];
    NSURLSession *session = [NSURLSession sharedSession];
    NSURLSessionDataTask *dataTask = [session dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (!error) {
            id tem = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
            success(tem);
        }else {
            err(error);
        }
    }];
    [dataTask resume];
}




@end
