//
//  WBStatusLayout.h
//  WBDemo
//
//  Created by yl on 2019/6/26.
//  Copyright © 2019 Liang. All rights reserved.
//

#import "YYKit.h"
#import "WBModel.h"

NS_ASSUME_NONNULL_BEGIN


#define kWBCellTitleHeight 36
#define kWBCellPadding     12       //cell内边距
#define kWBCellProfileHeight 56    //cell 名片高度
#define kWBCellNameWidth  (kScreenWidth - 110) // cell 名字最宽限制

#define kWBCellNamePaddingLeft  14 //name 和avatar之间的留白

#define kWBCellLineColor [UIColor colorWithWhite:0.00 alpha:0.09] //线条颜色





@interface WBStatusLayout : NSObject

@end

NS_ASSUME_NONNULL_END
