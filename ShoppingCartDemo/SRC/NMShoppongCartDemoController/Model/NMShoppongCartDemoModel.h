//
//  NMShoppongCartDemoModel.h
//  ShoppingCartDemo
//
//  Created by nuomi on 16/8/29.
//  Copyright © 2016年 nuomi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UIKit/UIKit.h"

@interface NMShoppongCartDemoModel : NSObject
/**
 *  图片地址
 */
@property (nonatomic, copy) NSString * imageUrl;

/**
 *  商品价格
 */
@property (nonatomic, copy) NSString * price;

/**
 *  商品标题
 */
@property (nonatomic, copy) NSString * title;

/**
 *  当前的商品个数
 */
@property (nonatomic, copy) NSString * curentNum;

/**
 *  是否选中
 */
@property (nonatomic, assign) BOOL isSelected;

/**
 *  控制器
 */
@property (nonatomic, weak) UIViewController * vc;

@end
