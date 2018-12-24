//
//  UIViewController+TableView.h
//  iOS-Project
//
//  Created by wudan on 2018/12/24.
//  Copyright © 2018 wudan. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIViewController (WDTableView)

/**
    1、为了方便使用，仅仅初始化，并设置高度和预估高度
    2、使用时，需要设置代理和数据源
 */
@property (nonatomic, strong, nullable) UITableView *tableView;

@end

NS_ASSUME_NONNULL_END
