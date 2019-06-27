//
//  WBStatusHelper.m
//  WBDemo
//
//  Created by yl on 2019/6/27.
//  Copyright © 2019 Liang. All rights reserved.
//

#import "WBStatusHelper.h"

@implementation WBStatusHelper

+ (UIImage *)imageNamed:(NSString *)name
{
    if (!name) return nil;
    UIImage *image = [[self imageCache] objectForKey:name];
    if(image) return image;
    NSString *ext = name.pathExtension;
    if(ext.length == 0) ext = @"png";
    NSString *path = [[self bundle] pathForResource:name ofType:ext];
    if(!path) return nil;
    image = [UIImage imageWithContentsOfFile:path];
    image = [image imageByDecoded];
    if(!image) return nil;
    [[self imageCache] setObject:image forKey:name];
    return image;
}

+ (YYMemoryCache *)imageCache
{
    static YYMemoryCache *cache;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        cache = [YYMemoryCache new];
        cache.shouldRemoveAllObjectsOnMemoryWarning = NO;
        cache.shouldRemoveAllObjectsWhenEnteringBackground = NO;
        cache.name = @"WeiboImageCache";
    });
    return cache;
}

+ (NSBundle *)bundle
{
    static NSBundle *bundle;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        NSString *path = [[NSBundle mainBundle] pathForResource:@"ResourceWeibo" ofType:@"bundle"];
        bundle = [NSBundle bundleWithPath:path];
    });
    return bundle;
}



@end
