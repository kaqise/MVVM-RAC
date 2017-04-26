//
//  YSBaseView.m
//  Demo_RAC
//
//  Created by fdiostwo on 2017/4/25.
//  Copyright © 2017年 FengDingKeJi. All rights reserved.
//

#import "YSBaseView.h"

@implementation YSBaseView
- (instancetype)init
{
    self = [super init];
    if (self) {
        [self ys_initUI];
        [self ys_bindViewModel];
        [self setNeedsUpdateConstraints];
        [self updateConstraintsIfNeeded];
    }
    return self;
}
- (instancetype)initWithViewModel:(id<YSBaseViewModelProtocol>)viewModel{
    
     return [self init];
}

- (void)updateConstraints{
    [self ys_setupFrame];
    [super updateConstraints];
}
- (void)ys_bindViewModel{}
- (void)ys_initUI{}
- (void)ys_setupFrame{}

@end
