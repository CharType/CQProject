//
//  CQiOSDevelopmentViewController.m
//  CQProject
//
//  Created by CharType on 2020/8/7.
//  Copyright © 2020 CharType. All rights reserved.
//  iOS开发高手课学习

#import "CQiOSDevelopmentViewController.h"
#import "CQBDDTestViewController.h"
#import "CQ16InstruMentsViewController.h"
#import "CQPackageViewController.h"
#import "CQFishHookViewController.h"
#import "CQFBRetainCycleDetectorViewController.h"

@interface CQiOSDevelopmentViewController ()
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) RETableViewManager *tableManager;
@property (nonatomic, strong) RETableViewSection *section;
@end

@implementation CQiOSDevelopmentViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.tableView];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.bottom.equalTo(self.view);
    }];
    [self.tableManager addSection:self.section];
    
    RETableViewItem *item = [[RETableViewItem alloc] initWithTitle:@"29:单元测试"];
    @weakify(self);
    item.selectionHandler = ^(id item) {
        @strongify(self);
        CQBDDTestViewController *vc = [[CQBDDTestViewController alloc] init];
        [self.navigationController pushViewController:vc animated:YES];
    };
    [self.section addItem:item];
    
    RETableViewItem *InstruMentsItem = [[RETableViewItem alloc] initWithTitle:@"16:性能监控"];
    InstruMentsItem.selectionHandler = ^(id item) {
        @strongify(self);
        CQ16InstruMentsViewController *vc = [[CQ16InstruMentsViewController alloc] init];
        [self.navigationController pushViewController:vc animated:YES];
    };
    [self.section addItem:InstruMentsItem];
    
    RETableViewItem *packageItem = [[RETableViewItem alloc] initWithTitle:@"10:包大小优化"];
    packageItem.selectionHandler = ^(id item) {
        @strongify(self);
        CQPackageViewController *vc = [[CQPackageViewController alloc] init];
        [self.navigationController pushViewController:vc animated:YES];
    };
    [self.section addItem:packageItem];
    
    RETableViewItem *fishHookItem = [[RETableViewItem alloc] initWithTitle:@"fishhook学习"];
    fishHookItem.selectionHandler = ^(id item) {
        @strongify(self);
        CQFishHookViewController *vc = [[CQFishHookViewController alloc] init];
        [self.navigationController pushViewController:vc animated:YES];
    };
    [self.section addItem:fishHookItem];
    
    RETableViewItem *fbRetainCycleItem = [[RETableViewItem alloc] initWithTitle:@"FBRetainCycleDetector学习"];
    fbRetainCycleItem.selectionHandler = ^(id item) {
        @strongify(self);
        CQFBRetainCycleDetectorViewController *vc = [[CQFBRetainCycleDetectorViewController alloc] init];
        [self.navigationController pushViewController:vc animated:YES];
    };
    [self.section addItem:fbRetainCycleItem];
    
}

- (RETableViewManager *)tableManager {
    if (!_tableManager) {
        _tableManager = [[RETableViewManager alloc] initWithTableView:self.tableView];
    }
    return _tableManager;
}

- (RETableViewSection *)section {
    if (!_section) {
        _section = [[RETableViewSection alloc] init];
    }
    return _section;
}

- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStyleGrouped];
    }
    return _tableView;
}

@end
