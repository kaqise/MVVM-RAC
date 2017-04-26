//
//  YSBaseViewModelProtocol.h
//  Demo_RAC
//
//  Created by fdiostwo on 2017/4/25.
//  Copyright © 2017年 FengDingKeJi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "YSHttpClient.h"

typedef NS_ENUM(NSUInteger , YSRefreshStatus){
    YSRefreshStatus_HeaderRefresh = 1, //头刷新数据
    YSRefreshStatus_FooterMore, //加载增加数据
    YSRefreshStatus_FooterNoMore, //没有更多数据
};

@protocol YSBaseViewModelProtocol <NSObject>

/** 服务器 */
@property (nonatomic, strong)YSHttpClient *client;

- (void)ys_initialize;//初始化ViewModel

@end
