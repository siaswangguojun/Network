//
//  NetworkRequestManager.h
//  NetworkRequest
//
//  Created by lanouhn on 16/4/26.
//  Copyright © 2016年 王国军. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum {
    POST,
    GET
}RequestType;

typedef void(^RequestFinish)(id responseObject);
typedef void(^RequestError)(NSError *error);

@interface NetworkRequestManager : NSObject

//声明类方法
+ (void)requestWithGetUrl:(NSString *)url Pardic:(NSDictionary *)pardic success:(RequestFinish)success err:(RequestError)err;
+ (void)requestWithPostUrl:(NSString *)url Pardic:(NSDictionary *)pardic success:(RequestFinish)success err:(RequestError)err;




//注意!!!!!
//用于处理GET请求返回的数据  直接是html格式....
//将html处理成字符串进行返回.
+ (void)requestWithGetUrl:(NSString *)urlstr success:(RequestFinish)success err:(RequestError)err;


@end
