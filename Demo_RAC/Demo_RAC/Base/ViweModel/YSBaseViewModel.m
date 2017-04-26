//
//  YSBaseViewModel.m
//  Demo_RAC
//
//  Created by fdiostwo on 2017/4/25.
//  Copyright © 2017年 FengDingKeJi. All rights reserved.
//

#import "YSBaseViewModel.h"

@implementation YSBaseViewModel

@synthesize client = _client;

+ (instancetype)allocWithZone:(struct _NSZone *)zone{
    
    YSBaseViewModel *viewModel = [super allocWithZone:zone];
    
    if (viewModel) {
        
        [viewModel ys_initialize];
        
    }
    return viewModel;
}

- (YSHttpClient *)client{
    if (!_client) {
        _client = [YSHttpClient sharedClient];
    }
    return _client;
}

- (void)ys_initialize{}

@end
