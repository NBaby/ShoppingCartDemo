//
//  NMShoppongCartDemoModel.m
//  ShoppingCartDemo
//
//  Created by nuomi on 16/8/29.
//  Copyright © 2016年 nuomi. All rights reserved.
//

#import "NMShoppongCartDemoModel.h"

@implementation NMShoppongCartDemoModel

- (void)setVc:(UIViewController *)vc{
    _vc = vc;
    [self addObserver:vc forKeyPath:@"isSelected" options:NSKeyValueObservingOptionNew|NSKeyValueObservingOptionOld context:nil];
    
    [self addObserver:vc forKeyPath:@"curentNum" options:NSKeyValueObservingOptionNew|NSKeyValueObservingOptionOld context:nil];
}

- (void)dealloc{
    if (_vc != nil){
        [self removeObserver:_vc forKeyPath:@"curentNum"];
        [self removeObserver:_vc forKeyPath:@"isSelected"];
    }
}

@end
