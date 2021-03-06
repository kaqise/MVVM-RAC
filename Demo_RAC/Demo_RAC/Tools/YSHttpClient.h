//
//  YSHttpClient.h
//  Demo_RAC
//
//  Created by fdiostwo on 2017/4/25.
//  Copyright © 2017年 FengDingKeJi. All rights reserved.
//

#import <AFNetworking/AFNetworking.h>
#import <UIKit/UIKit.h>

typedef void (^HttpSuccessBlock)(id json);
typedef void (^HttpFailureBlock)(NSError * error);
typedef void (^HttpDownloadProgressBlock)(CGFloat progress);
typedef void (^HttpUploadProgressBlock)(CGFloat progress);

@interface YSHttpClient : AFHTTPSessionManager

+ (instancetype)sharedClient;


/**
 *  get网络请求
 *
 *  @param path    url地址
 *  @param params  url参数  NSDictionary类型
 *  @param success 请求成功 返回NSDictionary或NSArray
 *  @param failure 请求失败 返回NSError
 */

- (NSURLSessionDataTask *)getWithPath:(NSString *)path
                               params:(NSDictionary *)params
                              success:(HttpSuccessBlock)success
                              failure:(HttpFailureBlock)failure;

/**
 *  post网络请求
 *
 *  @param path    url地址
 *  @param params  url参数  NSDictionary类型
 *  @param success 请求成功 返回NSDictionary或NSArray
 *  @param failure 请求失败 返回NSError
 */

- (NSURLSessionDataTask *)postWithPath:(NSString *)path
                                params:(NSDictionary *)params
                               success:(HttpSuccessBlock)success
                               failure:(HttpFailureBlock)failure;

/**
 *  下载文件
 *
 *  @param path     url路径
 *  @param success  下载成功
 *  @param failure  下载失败
 *  @param progress 下载进度
 */

- (NSURLSessionDownloadTask *)downloadWithPath:(NSString *)path
                                       success:(HttpSuccessBlock)success
                                       failure:(HttpFailureBlock)failure
                                      progress:(HttpDownloadProgressBlock)progress;

/**
 *  上传图片
 *
 *  @param path     url地址
 *  @param image    UIImage对象
 *  @param imagekey    imagekey
 *  @param params  上传参数
 *  @param success  上传成功
 *  @param failure  上传失败
 *  @param progress 上传进度
 */

- (NSURLSessionDataTask *)uploadImageWithPath:(NSString *)path
                                       params:(NSDictionary *)params
                                    thumbName:(NSString *)imagekey
                                        image:(UIImage *)image
                                      success:(HttpSuccessBlock)success
                                      failure:(HttpFailureBlock)failure
                                     progress:(HttpUploadProgressBlock)progress;

@end
