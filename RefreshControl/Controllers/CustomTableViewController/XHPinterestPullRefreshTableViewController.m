//
//  XHPinterestPullRefreshTableViewController.m
//  XHRefreshControlExample
//
//  Created by Jack_iMac on 15/8/7.
//  Copyright (c) 2015年 嗨，我是曾宪华(@xhzengAIB)，曾加入YY Inc.担任高级移动开发工程师，拍立秀App联合创始人，热衷于简洁、而富有理性的事物 QQ:543413507 主页:http://zengxianhua.com All rights reserved.
//

#import "XHPinterestPullRefreshTableViewController.h"

#import "XHPinterestRefreshView.h"

@interface XHPinterestPullRefreshTableViewController ()

@property (nonatomic, strong) XHPinterestRefreshView *refreshView;

@end

@implementation XHPinterestPullRefreshTableViewController

#pragma mark - Propertys

- (XHPinterestRefreshView *)refreshView {
    if (!_refreshView) {
        _refreshView = [[XHPinterestRefreshView alloc] initWithFrame:CGRectMake(0, -50, CGRectGetWidth(self.view.bounds), 50)];
        _refreshView.activityIndicatorColor = self.indicatorColor;
    }
    return _refreshView;
}

#pragma mark - XHRefreshControl Delegate

- (UIView *)customPullDownRefreshView {
    return self.refreshView;
}

- (void)customPullDownRefreshViewRefreshState:(XHRefreshState)refreshState {
    switch (refreshState) {
        case XHRefreshStateNormal:
        case XHRefreshStateStopped:
            [self.refreshView normal];
            break;
        case XHRefreshStateLoading:
            [self.refreshView refreing];
            break;
        case XHRefreshStatePulling:
            break;
        default:
            break;
    }
}

- (void)customPullDownRefreshView:(UIView *)customPullDownRefreshView withPullDownOffset:(CGFloat)pullDownOffset {
    self.refreshView.pullDownOffset = pullDownOffset;
}

- (void)customPullDownRefreshViewWillStartRefresh:(UIView *)customPullDownRefreshView {
    [self.refreshView willStartRefreshing];
}
- (void)customPullDownRefreshViewDidStartRefresh:(UIView *)customPullDownRefreshView {
    [self.refreshView didStartRefreshing];
}

- (void)customPullDownRefreshViewWillEndRefresh:(UIView *)customPullDownRefreshView {
    [self.refreshView willEndRefreshing];
}
- (void)customPullDownRefreshViewDidEndRefresh:(UIView *)customPullDownRefreshView {
    [self.refreshView didEndRefresing];
}

- (XHPullDownRefreshViewType)pullDownRefreshViewType {
    return XHPullDownRefreshViewTypeCustom;
}

@end
