//
//  WBModel.h
//  WBDemo
//
//  Created by yl on 2019/6/25.
//  Copyright © 2019 Liang. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN


typedef NS_ENUM(NSInteger, WBUserVerifyType){
    WBUserVerifyTypeNone = 0,   // 没有认证
    WBUserVerifyTypeStandard,   // 个人认证 黄V
    WBUserVerifyTypeOrganization,   //官方认证 蓝V
    WBUserVerifyTypeClub,   // 达人认证 红星
};

@interface WBUser : NSObject

@end

@interface WBModel : NSObject

@end

NS_ASSUME_NONNULL_END
