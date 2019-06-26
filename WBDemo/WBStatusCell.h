//
//  WBStatusCell.h
//  WBDemo
//
//  Created by yl on 2019/6/25.
//  Copyright © 2019 Liang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "YYKit.h"
#import "WBStatusLayout.h"
#import "WBModel.h"
#import "YYTableViewCell.h"

NS_ASSUME_NONNULL_BEGIN

@class WBStatusCell;
@protocol WBStatusCellDelgate;

@interface WBStatusTitleView : UIView
@property(nonatomic, strong) YYLabel *titleLabel;
@property(nonatomic, strong) UIButton *arrowButton;
@property(nonatomic, strong) WBStatusCell *cell;
@end


@interface WBStatusProfileView : UIView

@property(nonatomic, strong) UIImageView *avatarView; //头像
@property(nonatomic, strong) UIImageView *avatarBadgeView; //徽章
@property(nonatomic, strong) YYLabel *nameLabel;
@property(nonatomic, strong) YYLabel *sourceLabel;
@property(nonatomic, strong) UIImageView *backgroundImageView;
@property(nonatomic, strong) UIButton *arrowButton;
@property(nonatomic, strong) UIButton *followButton;
@property(nonatomic, assign) WBUserVerifyType verifyType;
@property(nonatomic, weak) WBStatusCell *cell;

@end


@interface WBStatusCardView : UIView

@property(nonatomic, strong) UIImageView *imageView;
@property(nonatomic, strong) UIImageView *badgeImageView;
@property(nonatomic, strong) YYLabel *label;
@property(nonatomic, strong) UIButton *button;
@property(nonatomic, weak) WBStatusCell *cell;

@end

@interface WBStatusToolbarView : UIView

@property(nonatomic, strong) UIButton *repostButton;
@property(nonatomic, strong) UIButton *commentButton;
@property(nonatomic, strong) UIButton *likeButton;

@property(nonatomic, strong) UIImageView *repostImageView;
@property(nonatomic, strong) UIImageView *commentImageView;
@property(nonatomic, strong) UIImageView *likeImageView;

@property(nonatomic, strong) YYLabel *repostLabel;
@property(nonatomic, strong) YYLabel *commentLabel;
@property(nonatomic, strong) YYLabel *likeLabel;

@property(nonatomic, strong) CAGradientLayer *line1;
@property(nonatomic, strong) CAGradientLayer *line2;
@property(nonatomic, strong) CALayer *topLine;
@property(nonatomic, strong) CALayer *bottomLine;
@property(nonatomic, weak) WBStatusCell *cell;

- (void)setWithLayout:(WBStatusLayout *)layout;

- (void)setLiked:(BOOL)liked withAnimation:(BOOL)animation;

@end

@interface WBStatusTagView : UIView

@property(nonatomic, strong) UIImageView *imageView;
@property(nonatomic, strong) YYLabel *label;
@property(nonatomic, strong) UIButton *button;
@property(nonatomic, weak) WBStatusCell *cell;

@end

@interface WBStatusView : UIView

@property(nonatomic, strong) UIView *contentView; //容器
@property(nonatomic, strong) WBStatusTitleView *titleView; //标题栏
@property(nonatomic, strong) YYLabel *textLabel; //文本
@property(nonatomic, strong) NSArray<UIView *> *picViews; //图片
@property(nonatomic, strong) UIView *retweetBackgroundView; //转发容器
@property(nonatomic, strong) YYLabel *retweetTextLabel; //转发文本
@property(nonatomic, strong) WBStatusCardView *cardView; //卡片
@property(nonatomic, strong) WBStatusTagView *tagView; //Tag
@property(nonatomic, strong) WBStatusToolbarView *toolbarView; //工具栏
@property(nonatomic, strong) UIImageView *vipBackgroundView; //vip自定义背景
@property(nonatomic, strong) UIButton *menuButton; //菜单按钮
@property(nonatomic, strong) UIButton *followButton; //关注按钮

@property(nonatomic, strong) WBStatusLayout *layout;
@property(nonatomic, weak) WBStatusCell *cell;

@end


@protocol WBStatusCellDelgate;
@interface WBStatusCell : YYTableViewCell

@property(nonatomic, weak) id<WBStatusCellDelgate> delegate;
@property(nonatomic, strong) WBStatusView *statusView;
- (void)setLayout:(WBStatusLayout *)layout;

@end


@protocol WBStatusCellDelgate <NSObject>

@optional
//点击了cell
- (void)cellDidClick:(WBStatusCell *)cell;
//点击了卡片
- (void)cellDidClickCard:(WBStatusCell *)cell;
//点击了转发内容
- (void)cellDidClickRetweet:(WBStatusCell *)cell;
//点击了菜单
- (void)cellDidClickMenu:(WBStatusCell *)cell;
//点击了关注
- (void)cellDidClickFollow:(WBStatusCell *)cell;
//点击了转发
- (void)cellDidClickRepost:(WBStatusCell *)cell;
//点击了Tag
- (void)cellDidClickTag:(WBStatusCell *)cell;
//点击了评论
- (void)cellDidClickComment:(WBStatusCell *)cell;
//点击了赞
- (void)cellDidClickLike:(WBStatusCell *)cell;
//点击了用户
- (void)cell:(WBStatusCell *)cell didClickUser:(WBUser *)user;
//点击了图片
- (void)cell:(WBStatusCell *)cell didClickImageAtIndex:(NSUInteger)index;
//点击了Label的链接
- (void)cell:(WBStatusCell *)cell didClickInLabel:(YYLabel *)label textRange:(NSRange)textRange;

@end

NS_ASSUME_NONNULL_END
