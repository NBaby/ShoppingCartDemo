//
//  JSToolManager.h
//  MatchingPlatform
//
//  Created by nuomi on 16/4/7.
//  Copyright © 2016年 alan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JSToolManager : NSObject
///判断是否为整形
+ (BOOL)isPureInt:(NSString*)string;
///判断是否为浮点型
+ (BOOL)isPureFloat:(NSString*)string;

@end
