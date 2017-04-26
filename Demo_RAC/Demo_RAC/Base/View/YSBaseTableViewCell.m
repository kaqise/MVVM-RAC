//
//  YSBaseTableViewCell.m
//  Demo_RAC
//
//  Created by fdiostwo on 2017/4/26.
//  Copyright © 2017年 FengDingKeJi. All rights reserved.
//

#import "YSBaseTableViewCell.h"

@implementation YSBaseTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self) {
        
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        
        [self ys_initUI];
        
        [self ys_setupFrame];
        
    }
    return self;
}


- (void)ys_initUI{}

- (void)ys_setupFrame{}




@end
