//
//  BookListView.m
//  Demo_RAC
//
//  Created by fdiostwo on 2017/4/26.
//  Copyright © 2017年 FengDingKeJi. All rights reserved.
//

#import "BookListView.h"
#import "YSCustomTableViewCell.h"
#import "BookListViewModel.h"

@interface BookListView ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong)UITableView *tableView;

@property (nonatomic, strong)BookListViewModel *viewModel;

@end

@implementation BookListView

- (instancetype)initWithViewModel:(id<YSBaseViewModelProtocol>)viewModel{
    
    self.viewModel = (BookListViewModel*)viewModel;
    
    return [super initWithViewModel:viewModel];
}


- (void)ys_initUI{
    
    [self addSubview:self.tableView];
    
}

- (void)ys_setupFrame{
    
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.edges.mas_equalTo(0);
        
    }];
}

- (void)ys_bindViewModel{
    
    [self.viewModel.booksDataCommand execute:nil];
    
    @weakify(self);
    [self.viewModel.refreshUI subscribeNext:^(id x) {
        @strongify(self);
        
        [self.tableView reloadData];
    }];
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    
    return self.viewModel.books.count;
    
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    YSCustomTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([YSCustomTableViewCell class]) forIndexPath:indexPath];
    
    cell.model = self.viewModel.books[indexPath.row];
    
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 200;
}
- (UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        [_tableView registerClass:[YSCustomTableViewCell class] forCellReuseIdentifier:NSStringFromClass([YSCustomTableViewCell class])];
        _tableView.tableFooterView = [UIView new];
    }
    return _tableView;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    [self.viewModel.cellClick sendNext:indexPath];
    
}


@end
