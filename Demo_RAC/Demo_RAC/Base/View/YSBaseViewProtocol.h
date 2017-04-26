//
//  YSBaseViewProtocol.h
//  Demo_RAC
//
//  Created by fdiostwo on 2017/4/25.
//  Copyright © 2017年 FengDingKeJi. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol YSBaseViewModelProtocol;

@protocol YSBaseViewProtocol <NSObject>

@optional
- (instancetype)initWithViewModel:(id<YSBaseViewModelProtocol>)viewModel;//根据ViewModel创建视图方便绑定
- (void)ys_initUI;//创建并添加到父视图
- (void)ys_bindViewModel;//绑定ViewModel
- (void)ys_setupFrame;//布局

@end
