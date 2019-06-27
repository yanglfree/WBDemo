//
//  WBStatus.h
//  WBDemo
//
//  Created by yl on 2019/6/27.
//  Copyright © 2019 Liang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WBModel.h"

NS_ASSUME_NONNULL_BEGIN


//微博
@interface WBStatus : NSObject

@property(nonatomic, strong) WBUser *user;

@property(nonatomic, strong) WBStatus *retweetedStatus;

@property(nonatomic, strong) WBPageInfo *pageInfo;



@end

NS_ASSUME_NONNULL_END
