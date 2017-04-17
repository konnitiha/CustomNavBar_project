//
//  MyDownload.h
//  GouHi
//
//  Created by xujian on 15/9/22.
//  Copyright (c) 2015年 xujian. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFNetworking.h"

#define kBaseUrlWith(object) [NSString stringWithFormat:@"http://wx.zwzyd.com/api/%@", object]
#define kResourceUrlWith(object) [NSString stringWithFormat:@"http://wx.zwzyd.com/%@", object]

@interface MyDownload : NSObject

+(MyDownload *)shareDownload;


- (void)Post:(NSString *)url
              params:(NSDictionary *)paramsDict
             success:(void (^)(NSDictionary *success))success
             failure:(void (^)(NSError *failure))failure;




@end
