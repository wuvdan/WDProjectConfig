//
//  UIViewController+TableView.m
//  iOS-Project
//
//  Created by wudan on 2018/12/24.
//  Copyright © 2018 wudan. All rights reserved.
//

#import "UIViewController+WDTableView.h"
#import <objc/runtime.h>

const char *wdTableViewKey = "wdTableViewKey";

@implementation UIViewController (WDTableView)

- (UITableView *)tableView {
    UITableView *tableView = objc_getAssociatedObject(self, wdTableViewKey);
    if (!tableView) {
        tableView = [[UITableView alloc] init];
        tableView.tableFooterView = [[UIView alloc] init];
        tableView.estimatedRowHeight = 65.f;
        tableView.rowHeight = UITableViewAutomaticDimension;
        tableView.backgroundColor = [UIColor groupTableViewBackgroundColor];
        objc_setAssociatedObject(self, wdTableViewKey, tableView, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    return tableView;
}

- (void)setTableView:(UITableView *)tableView {
    objc_setAssociatedObject(self, wdTableViewKey, tableView, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

@end
