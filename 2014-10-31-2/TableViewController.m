//
//  TableViewController.m
//  2014-10-31-2
//
//  Created by TTC on 10/31/14.
//  Copyright (c) 2014 TTC. All rights reserved.
//

#import "TableViewController.h"
#import "ContactCell.h"
#import "ContactData.h"

@interface TableViewController () {
    NSMutableArray *_contactArray;
    NSArray *_tempArray;
    BOOL _bIsAdd;
    NSInteger _indexPathNumber;
    UITableView *_tableView;
}

@end

@implementation TableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
       
    _contactArray = [NSMutableArray array];
    
    UIBarButtonItem *rightButton =
    [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd
                                                  target:self
                                                  action:@selector(selectRightAction)];
    self.navigationItem.rightBarButtonItem = rightButton;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _contactArray.count;
}

// 协议方法用BOOL来判断用户是点击了右上角的添加按钮还是点击了Cell修改内容
- (void)passValue:(ContactData *)data {
    if (_bIsAdd) {
        [_contactArray addObject:data];
    }
    else {
        _contactArray[_indexPathNumber] = data;
        [self.tableView reloadData];
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *ID = @"cell";
    ContactCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        cell = [[ContactCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:ID];
    }
    ContactData *data = _contactArray[indexPath.row];
    cell.data = data;
    return cell;
}

- (void)selectRightAction {
    _bIsAdd = YES;
    NSLog(@"%@", _bIsAdd? @"YES":@"NO");
    DetailViewController *detailViewCtrl = [[DetailViewController alloc] init];
    detailViewCtrl.delegate = self;
    [self.navigationController pushViewController:detailViewCtrl animated:YES];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    _bIsAdd = NO;
    NSLog(@"%@", _bIsAdd? @"YES":@"NO");
    DetailViewController *detailViewCtrl = [[DetailViewController alloc] init];
    detailViewCtrl.delegate = self;
    ContactData *data = [[ContactData alloc] init];
    data = _contactArray[indexPath.row];
    detailViewCtrl.name = data.name;
    detailViewCtrl.number = data.number;
    _indexPathNumber = indexPath.row;
    [self.navigationController pushViewController:detailViewCtrl animated:YES];
}

@end
