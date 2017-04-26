//
//  YSHttpClient.m
//  Demo_RAC
//
//  Created by fdiostwo on 2017/4/25.
//  Copyright © 2017年 FengDingKeJi. All rights reserved.
//

#define kResponseAbleAcceptContentType [NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript",@"text/html",@"plant/html",@"text/plain",@"text/xml", nil]

#import "YSHttpClient.h"

static NSString * kBaseUrl = HOST;

@implementation YSHttpClient

+ (instancetype)sharedClient{
    
    static YSHttpClient *client = nil;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
        
        client = [[YSHttpClient alloc]initWithBaseURL:[NSURL URLWithString:kBaseUrl] sessionConfiguration:configuration];
        
        client.requestSerializer.timeoutInterval = 10;
        
        client.responseSerializer.acceptableContentTypes = kResponseAbleAcceptContentType;
        //安全策略
        client.securityPolicy = [AFSecurityPolicy defaultPolicy];
        
    });
    return client;
}

- (NSURLSessionDataTask *)getWithPath:(NSString *)path
                               params:(NSDictionary *)params
                              success:(HttpSuccessBlock)success
                              failure:(HttpFailureBlock)failure {
    
    return [[YSHttpClient sharedClient] GET:path parameters:params progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        success(responseObject);
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        failure(error);
        
    }];
    
}

- (NSURLSessionDataTask *)postWithPath:(NSString *)path
                                params:(NSDictionary *)params
                               success:(HttpSuccessBlock)success
                               failure:(HttpFailureBlock)failure {
    
    return [[YSHttpClient sharedClient] POST:path parameters:params progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:responseObject options:kNilOptions error:nil];
        
        success(dic);
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        failure(error);
        
    }];
    
}

- (NSURLSessionDownloadTask *)downloadWithPath:(NSString *)path
                                       success:(HttpSuccessBlock)success
                                       failure:(HttpFailureBlock)failure
                                      progress:(HttpDownloadProgressBlock)progress {
    
    //获取完整的url路径
    NSString * urlString = [kBaseUrl stringByAppendingPathComponent:path];
    
    //下载
    NSURL *URL = [NSURL URLWithString:urlString];
    
    NSURLRequest *request = [NSURLRequest requestWithURL:URL];
    
    NSURLSessionDownloadTask *downloadTask = [[YSHttpClient sharedClient] downloadTaskWithRequest:request progress:^(NSProgress * _Nonnull downloadProgress) {
        
        progress(downloadProgress.fractionCompleted);
        
    } destination:^NSURL *(NSURL *targetPath, NSURLResponse *response) {
        
        //获取沙盒cache路径
        NSURL * documentsDirectoryURL = [[NSFileManager defaultManager] URLForDirectory:NSCachesDirectory inDomain:NSUserDomainMask appropriateForURL:nil create:NO error:nil];
        
        return [documentsDirectoryURL URLByAppendingPathComponent:[response suggestedFilename]];
        
        
    } completionHandler:^(NSURLResponse *response, NSURL *filePath, NSError *error) {
        
        if (error) {
            failure(error);
        } else {
            success(filePath.path);
        }
        
    }];
    
    [downloadTask resume];
    
    return downloadTask;
    
}

- (NSURLSessionDataTask *)uploadImageWithPath:(NSString *)path
                                       params:(NSDictionary *)params
                                    thumbName:(NSString *)imagekey
                                        image:(UIImage *)image
                                      success:(HttpSuccessBlock)success
                                      failure:(HttpFailureBlock)failure
                                     progress:(HttpUploadProgressBlock)progress {
    
    NSData * data = UIImagePNGRepresentation(image);
    
    return [[YSHttpClient sharedClient] POST:path parameters:params constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
        
        [formData appendPartWithFileData:data name:imagekey fileName:@"01.png" mimeType:@"image/png"];
        
    } progress:^(NSProgress * _Nonnull uploadProgress) {
        
        progress(uploadProgress.fractionCompleted);
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        success(responseObject);
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        failure(error);
        
    }];
}


@end
