//
//  ViewController.m
//  Demo_RAC
//
//  Created by fdiostwo on 2017/4/25.
//  Copyright © 2017年 FengDingKeJi. All rights reserved.
//

#import "ViewController.h"
#import "BookListViewModel.h"
#import "BookListView.h"
#import "SecondViewController.h"

@interface ViewController ()

@property (nonatomic, strong)BookListViewModel *viewModel;

@property (nonatomic, strong)BookListView *mainView;

@end

@implementation ViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.title = @"主页";
    
}

- (void)ys_initUI{
    
    _mainView = [[BookListView alloc]initWithViewModel:_viewModel];
    
    [self.view addSubview:_mainView];

}

- (void)ys_initViewModel{

    _viewModel = [BookListViewModel new];
    
}

- (void)ys_bindViewModel{
    @weakify(self);
    [self.viewModel.cellClick subscribeNext:^(id x) {
        @strongify(self);
        
        NSIndexPath *indexPath = (NSIndexPath*)x;
        SecondViewController *second = [[SecondViewController alloc]init];
        second.tit = [NSString stringWithFormat:@"第%ld个Cell",indexPath.row];
        [self.navigationController pushViewController:second animated:YES];
    }];
    
}

- (void)ys_setupFrame{
    
    [_mainView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.edges.mas_equalTo(0);
    }];
}




@end
