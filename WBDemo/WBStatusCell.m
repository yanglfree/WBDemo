//
//  WBStatusCell.m
//  WBDemo
//
//  Created by yl on 2019/6/25.
//  Copyright © 2019 Liang. All rights reserved.
//

#import "WBStatusCell.h"
#import "WBStatusHelper.h"


@implementation WBStatusTitleView

- (instancetype)initWithFrame:(CGRect)frame
{
    if (frame.size.width == 0 && frame.size.height == 0) {
        frame.size.width = kScreenWidth;
        frame.size.height = kWBCellTitleHeight;
    }
    
    self = [super initWithFrame:frame];
    _titleLabel = [YYLabel new];
    _titleLabel.size = CGSizeMake(kScreenWidth - 100, self.height);
    _titleLabel.left = kWBCellPadding;
    _titleLabel.displaysAsynchronously = YES;
    _titleLabel.ignoreCommonProperties = YES;
    _titleLabel.fadeOnHighlight = NO;
    _titleLabel.fadeOnAsynchronouslyDisplay = NO;
    [self addSubview:_titleLabel];
    
    CALayer *line = [CALayer layer];
    line.size = CGSizeMake(self.width, CGFloatFromPixel(1));
    line.bottom = self.height;
    line.backgroundColor = kWBCellLineColor.CGColor;
    [self.layer addSublayer:line];
    self.exclusiveTouch = YES;
    return self;
}

@end

@implementation WBStatusProfileView
{
    BOOL _trackingTouch;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    if (frame.size.width == 0 && frame.size.height == 0) {
        frame.size.width = kScreenWidth;
        frame.size.height = kWBCellProfileHeight;
    }
    
    self = [super initWithFrame:frame];
    self.exclusiveTouch = YES;
    
    @weakify(self);
    
    _avatarView = [UIImageView new];
    _avatarView.size = CGSizeMake(40, 40);
    _avatarView.origin = CGPointMake(kWBCellPadding, kWBCellPadding + 3);
    _avatarView.contentMode = UIViewContentModeScaleAspectFill;
    [self addSubview:_avatarView];
    
    CALayer *avatarBorder = [CALayer layer];
    avatarBorder.frame = _avatarView.bounds;
    avatarBorder.borderWidth = CGFloatFromPixel(1);
    avatarBorder.borderColor = kWBCellLineColor.CGColor;
    avatarBorder.cornerRadius = _avatarView.height / 2;
    avatarBorder.shouldRasterize = YES;
    avatarBorder.rasterizationScale = kScreenScale;
    [_avatarView.layer addSublayer:avatarBorder];
    
    _avatarBadgeView = [UIImageView new];
    _avatarBadgeView.size = CGSizeMake(14, 14);
    _avatarBadgeView.center = CGPointMake(_avatarView.right - 6, _avatarView.bottom - 6);
    _avatarBadgeView.contentMode = UIViewContentModeScaleAspectFit;
    [self addSubview:_avatarBadgeView];
    
    _nameLabel = [YYLabel new];
    _nameLabel.size = CGSizeMake(kWBCellNameWidth, 24);
    _nameLabel.left = _avatarView.right + kWBCellNamePaddingLeft;
    _nameLabel.centerY = 27;
    _nameLabel.displaysAsynchronously = YES;
    _nameLabel.ignoreCommonProperties = YES;
    _nameLabel.fadeOnAsynchronouslyDisplay = NO;
    _nameLabel.fadeOnHighlight = NO;
    _nameLabel.lineBreakMode = NSLineBreakByClipping;
    _nameLabel.textVerticalAlignment = YYTextVerticalAlignmentCenter;
    [self addSubview:_nameLabel];
    
    _sourceLabel = [YYLabel new];
    _sourceLabel.frame = _nameLabel.frame;
    _sourceLabel.centerY = 47;
    _sourceLabel.displaysAsynchronously = YES;
    _sourceLabel.ignoreCommonProperties = YES;
    _sourceLabel.fadeOnAsynchronouslyDisplay = NO;
    _sourceLabel.fadeOnHighlight = NO;
    _sourceLabel.highlightTapAction = ^(UIView * _Nonnull containerView, NSAttributedString * _Nonnull text, NSRange range, CGRect rect) {
        if ([weak_self.cell.delegate respondsToSelector:@selector(cell:didClickInLabel:textRange:)]) {
            [weak_self.cell.delegate cell:weak_self.cell didClickInLabel:(YYLabel *)containerView textRange:range];
        }
    };
    [self addSubview:_sourceLabel];
    return self;
}

- (void)setVerifyType:(WBUserVerifyType)verifyType
{
    _verifyType = verifyType;
    switch (verifyType) {
        case WBUserVerifyTypeStandard:{
            _avatarBadgeView.hidden = NO;
            _avatarBadgeView.image = [WBStatusHelper imageNamed:@"avatar_vip"];
        }
            break;
            
        case WBUserVerifyTypeOrganization:{
            
            _avatarBadgeView.hidden = NO;
            _avatarBadgeView.image = [WBStatusHelper imageNamed:@"avatar_grassroot"];
            
        }
            break;
            
        default:{
            _avatarBadgeView.hidden = YES;
        }
            break;
    }
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    _trackingTouch = NO;
    UITouch *t = touches.anyObject;
    CGPoint p = [t locationInView:_avatarView];
    if (CGRectContainsPoint(_avatarView.bounds, p)) {
        _trackingTouch = YES;
    }
    p = [t locationInView:_nameLabel];
    if (CGRectContainsPoint(_nameLabel.bounds, p) && _nameLabel.textLayout.textBoundingRect.size.width > p.x) {
        _trackingTouch = YES;
    }
    
    if (!_trackingTouch) {
        [super touchesBegan:touches withEvent:event];
    }
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    if (!_trackingTouch) {
        [super touchesEnded:touches withEvent:event];
    }else{
        if ([_cell.delegate respondsToSelector:@selector(cell:didClickUser:)]) {
            [_cell.delegate cell:_cell didClickUser:_cell.statusView.layout.status.user];
        }
    }
}

- (void)touchesCancelled:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    if (!_trackingTouch) {
        [super touchesCancelled:touches withEvent:event];
    }
}

@end


@implementation WBStatusCardView{
    BOOL _isRetweet;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    if (frame.size.width == 0 && frame.size.height == 0) {
        frame.size.width = kScreenWidth;
        frame.origin.x = kWBCellPadding;
    }
    self = [super initWithFrame:frame];
    self.exclusiveTouch = YES;
    
    _imageView = [UIImageView new];
    _imageView.clipsToBounds = YES;
    _imageView.contentMode = UIViewContentModeScaleAspectFill;
    _badgeImageView = [UIImageView new];
    _badgeImageView.clipsToBounds = YES;
    _badgeImageView.contentMode = UIViewContentModeScaleAspectFit;
    _label = [YYLabel new];
    _label.textVerticalAlignment = YYTextVerticalAlignmentCenter;
    _label.numberOfLines = 3;
    _label.ignoreCommonProperties = YES;
    _label.displaysAsynchronously = YES;
    _label.fadeOnAsynchronouslyDisplay = NO;
    _label.fadeOnHighlight = NO;
    _button = [UIButton buttonWithType:UIButtonTypeCustom];
    [self addSubview:_imageView];
    [self addSubview:_badgeImageView];
    [self addSubview:_label];
    [self addSubview:_button];
    self.backgroundColor = kWBCellInnerViewColor;
    self.layer.borderWidth = CGFloatFromPixel(1);
    self.layer.borderColor = [UIColor colorWithWhite:0.00 alpha:0.070].CGColor;
    return self;
}

- (void)setWithLayout:(WBStatusLayout *)layout isRetweet:(BOOL)isRetweet
{
    WBPageInfo *pageIno = isRetweet ? layout.status.retweetedStatus.pageInfo : layout.status.pageInfo;
    if(!pageIno) return;
    self.height = isRetweet ? layout.retweetCardHeight : layout.cardHeight;
}





@end

@implementation WBStatusCell


@end
