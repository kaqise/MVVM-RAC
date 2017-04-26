//
//  BookListViewModel.h
//  Demo_RAC
//
//  Created by fdiostwo on 2017/4/26.
//  Copyright © 2017年 FengDingKeJi. All rights reserved.
//

#import "YSBaseViewModel.h"
#import "BookModel.h"

@interface BookListViewModel : YSBaseViewModel

@property (nonatomic, strong)NSArray <BookModel *> *books;

@property (nonatomic, strong)RACCommand *booksDataCommand;

@property (nonatomic, strong)RACSubject *refreshUI;

@property (nonatomic, strong)RACSubject *cellClick;

@end
