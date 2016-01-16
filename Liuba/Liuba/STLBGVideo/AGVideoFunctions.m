//
//  STLVideoFunctions.m
//  STLBGVideo
//
//  Created by StoneLeon on 16/1/13.
//  Copyright © 2016年 StoneLeon. All rights reserved.
//

#import "AGVideoFunctions.h"

@implementation AGVideoFunctions
/**
 *  获取plist文件
 */
+ (NSDictionary *)getUrlInfo {

    NSString *MD5PlistPath = [[NSBundle mainBundle] pathForResource:@"C415F3F13BBD50B1-info" ofType:@"plist"];
    NSDictionary *dict = [NSDictionary dictionaryWithContentsOfFile:MD5PlistPath];
    return dict;
}

+ (NSString *)getVideoUrl {

    NSString *videoUrl = [[AGVideoFunctions getUrlInfo] objectForKey:@"Url"];
    return videoUrl;
}

+ (NSString *)getVideoType {

    NSString *Type = [[AGVideoFunctions getUrlInfo] objectForKey:@"Type"];
    return Type;
}

+ (BOOL)getLoopMode {

    BOOL ModeBool = [[[AGVideoFunctions getUrlInfo] objectForKey:@"Mode Loop"] boolValue];
    return ModeBool;
}
@end
// 版权属于原作者
// http://code4app.com (cn) http://code4app.net (en)
// 发布代码于最专业的源码分享网站: Code4App.com