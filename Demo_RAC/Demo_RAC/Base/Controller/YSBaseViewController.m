//
//  BaseViewController.m
//  Demo_RAC
//
//  Created by fdiostwo on 2017/4/25.
//  Copyright © 2017年 FengDingKeJi. All rights reserved.
//

#import "YSBaseViewController.h"

@implementation YSBaseViewController

- (instancetype)init
{
    self = [super init];
    if (self) {
        
        [self ys_initViewModel];
        
        [self ys_initUI];
        
        [self ys_bindViewModel];
        
    }
    return self;
}


-(void)viewWillLayoutSubviews{
    
    [super viewWillLayoutSubviews];
    
    [self ys_setupFrame];
}



- (void)ys_initUI{}

- (void)ys_initViewModel{}

- (void)ys_bindViewModel{}

- (void)ys_setupFrame{}




@end
