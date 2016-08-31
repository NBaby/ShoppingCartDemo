//
//  JSToolManager.m
//  MatchingPlatform
//
//  Created by nuomi on 16/4/7.
//  Copyright © 2016年 alan. All rights reserved.
//

#import "JSToolManager.h"

@implementation JSToolManager
+ (BOOL)isPureInt:(NSString*)string{
    NSScanner* scan = [NSScanner scannerWithString:string];
    int val;
    return [scan scanInt:&val] && [scan isAtEnd];
}
+ (BOOL)isPureFloat:(NSString*)string{
    NSScanner* scan = [NSScanner scannerWithString:string];
    float val;
    return[scan scanFloat:&val] && [scan isAtEnd];
}
@end
