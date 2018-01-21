//
//  ViewController.m
//  JJTableView_demo2
//
//  Created by lucy on 2018/1/21.
//  Copyright © 2018年 com.daoKeLegend. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;

@end

@implementation ViewController

#pragma mark -  Override Base Function

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.tableView = [[UITableView alloc] initWithFrame:self.view.frame];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
    [self.view addSubview:self.tableView];
}

#pragma mark - UITableViewDelegate, UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 100.0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    return cell;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    return  YES;
}

- (NSArray<UITableViewRowAction *> *)tableView:(UITableView *)tableView editActionsForRowAtIndexPath:(NSIndexPath *)indexPath
{
    // 添加一个删除按钮
    UITableViewRowAction *deleteRowAction = [UITableViewRowAction rowActionWithStyle:UITableViewRowActionStyleDestructive title:@"删除"handler:^(UITableViewRowAction *action,NSIndexPath *indexPath) {
        
        NSLog(@"点击了删除");
    }];
    
    // 添加一个标为已读按钮
    UITableViewRowAction *hasReadAction = [UITableViewRowAction rowActionWithStyle:UITableViewRowActionStyleNormal title:@"标为已读"handler:^(UITableViewRowAction *action,NSIndexPath *indexPath) {
        
        NSLog(@"点击了标为已读");
    }];
    hasReadAction.backgroundColor = [UIColor orangeColor];
    
    // 添加一个更多按钮
    UITableViewRowAction *moreRowAction = [UITableViewRowAction rowActionWithStyle:UITableViewRowActionStyleNormal title:@"更多"handler:^(UITableViewRowAction *action,NSIndexPath *indexPath) {
        
        NSLog(@"点击了更多");
    }];
    moreRowAction.backgroundEffect = [UIBlurEffect effectWithStyle:UIBlurEffectStyleDark];
    
    // 将设置好的按钮放到数组中返回
    return @[deleteRowAction, hasReadAction, moreRowAction];
}

@end

