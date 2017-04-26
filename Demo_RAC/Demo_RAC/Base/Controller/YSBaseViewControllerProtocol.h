//
//  YSBaseViewControllerProtocol.h
//  Demo_RAC
//
//  Created by fdiostwo on 2017/4/25.
//  Copyright © 2017年 FengDingKeJi. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol YSBaseViewControllerProtocol <NSObject>

@optional

- (void)ys_bindViewModel;//绑定
- (void)ys_initUI;//初始化UI
- (void)ys_setupFrame;//设置Frame
- (void)ys_initViewModel;//初始化ViewModel

@end
