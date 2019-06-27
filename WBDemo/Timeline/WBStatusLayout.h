//
//  WBStatusLayout.h
//  WBDemo
//
//  Created by yl on 2019/6/26.
//  Copyright © 2019 Liang. All rights reserved.
//

#import "YYKit.h"
#import "WBModel.h"
#import "WBStatus.h"


NS_ASSUME_NONNULL_BEGIN


#define kWBCellTitleHeight 36
#define kWBCellPadding     12       //cell内边距
#define kWBCellProfileHeight 56    //cell 名片高度
#define kWBCellNameWidth  (kScreenWidth - 110) // cell 名字最宽限制

#define kWBCellNamePaddingLeft  14 //name 和avatar之间的留白

#define kWBCellLineColor [UIColor colorWithWhite:0.00 alpha:0.09] //线条颜色

#define kWBCellInnerViewColor UIColorHex(f7f7f7)



@interface WBStatusLayout : NSObject

@property(nonatomic, strong) WBStatus *status;



@property(nonatomic, assign) CGFloat cardHeight;
@property(nonatomic, assign) CGFloat retweetHeight;

@property(nonatomic, assign) CGFloat retweetCardHeight;

@end

NS_ASSUME_NONNULL_END
