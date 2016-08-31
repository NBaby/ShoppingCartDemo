//
//  NMShoppongCartDemoCell.h
//  ShoppingCartDemo
//
//  Created by nuomi on 16/8/29.
//  Copyright © 2016年 nuomi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NMAutoHeightTableCell.h"
@interface NMShoppongCartDemoCell<UITextFieldDelegate> : NMAutoHeightTableCell

@property (weak, nonatomic) IBOutlet UILabel *priceLabel;

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;

@property (weak, nonatomic) IBOutlet UITextField *numberTextField;

@property (weak, nonatomic) IBOutlet UIImageView *iconImageView;

@property (weak, nonatomic) IBOutlet UIButton *addBtn;

@property (weak, nonatomic) IBOutlet UIButton *subBtn;
@end
