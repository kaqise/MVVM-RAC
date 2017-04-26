//
//  BookListViewModel.m
//  Demo_RAC
//
//  Created by fdiostwo on 2017/4/26.
//  Copyright © 2017年 FengDingKeJi. All rights reserved.
//

#import "BookListViewModel.h"

@implementation BookListViewModel

- (void)ys_initialize{
    
    @weakify(self);
    [self.booksDataCommand.executionSignals.switchToLatest subscribeNext:^(id x) {
        @strongify(self);
        
        NSDictionary *dic = x;
        
        self.books = [BookModel mj_objectArrayWithKeyValuesArray:dic[@"result"][@"data"]];
        
        [self.refreshUI sendNext:nil];
    }];
    
}

- (RACCommand *)booksDataCommand{
    
    if (!_booksDataCommand) {
        @weakify(self);
        _booksDataCommand = [[RACCommand alloc]initWithSignalBlock:^RACSignal *(id input) {
            @strongify(self);
            RACSignal *signal = [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
                
                NSDictionary *parameters = @{@"key":@"56dec4f103caf9b2ffdd836142c2b9a2",@"catalog_id":@"242",@"pn":@"0",@"rn":@"10"};
                
                @strongify(self);
                
                [self.client getWithPath:query params:parameters success:^(id json) {
                    
                    [subscriber sendNext:json];
                    
                    [subscriber sendCompleted];
                    
                } failure:^(NSError *error) {
                    
                    [subscriber sendCompleted];
                    
                }];
                
                return nil;
            }];
            
            return signal;
            
        }];
    }
    return _booksDataCommand;
}

- (RACSubject *)refreshUI{
    if (!_refreshUI) {
        _refreshUI = [RACSubject subject];
    }
    return _refreshUI;
}
- (RACSubject *)cellClick{
    if (!_cellClick) {
        _cellClick = [RACSubject subject];
    }
    return _cellClick;
}

@end
