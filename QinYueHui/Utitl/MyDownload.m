//
//  MyDownload.m
//  GouHi
//
//  Created by xujian on 15/9/22.
//  Copyright (c) 2015年 xujian. All rights reserved.
//

#import "MyDownload.h"

@implementation MyDownload

+(MyDownload *)shareDownload
{
    static MyDownload *download;
    static dispatch_once_t once;
    
    dispatch_once (&once ,^{
        download = [[MyDownload alloc]init];
    });
    return download;
}

- (void)Post:(NSString *)url
              params:(NSDictionary *)paramsDict
             success:(void (^)(NSDictionary *success))success
             failure:(void (^)(NSError *failure))failure
{
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/html", @"text/json", @"text/plain", @"text/javascript", @"text/xml", @"image/*", nil];

    [manager.requestSerializer setValue:@"d5cfc46fa108f9a80176b0b2e5b3a6cf" forHTTPHeaderField:@"X-YUN-KEY"];
    [manager.requestSerializer setValue:@"f37e823016933259dbf26ff73dd25af7" forHTTPHeaderField:@"X-YUN-ID"];
    
    [SVProgressHUD show];
    [manager POST:url parameters:paramsDict progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if ([self returnSuccess:responseObject]) {
            [SVProgressHUD dismiss];
            success(responseObject);
        }else{
            [SVProgressHUD showErrorWithStatus:[self errorMessage:responseObject]];
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                [SVProgressHUD dismiss];
            });
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        failure(error);
        [SVProgressHUD showErrorWithStatus:@"请求失败"];
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [SVProgressHUD dismiss];
        });
    }];
}

//成功状态码判断
- (BOOL)returnSuccess:(NSDictionary *)dic{
    if (![dic[@"msg"] isKindOfClass:[NSNull class]]) {
        if (dic[@"msg"] != nil) {
            return YES;
        }
    }
     return NO;
    
}
//错误信息提取
- (NSString *)errorMessage:(NSDictionary *)dic{
    NSString *error = dic[@"Status"][@"Message"];
    return error;
}

@end
