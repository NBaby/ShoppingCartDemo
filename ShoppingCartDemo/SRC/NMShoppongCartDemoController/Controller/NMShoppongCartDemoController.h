//
//  NMShoppongCartDemoController.h
//  ShoppingCartDemo
//
//  Created by nuomi on 16/8/28.
//  Copyright © 2016年 nuomi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NMShoppongCartDemoController : UIViewController

@property (weak, nonatomic) IBOutlet UITableView *mainTableView;
/**
 *  总金额Label
 */
@property (weak, nonatomic) IBOutlet UILabel *totalPriceLabel;


@end
