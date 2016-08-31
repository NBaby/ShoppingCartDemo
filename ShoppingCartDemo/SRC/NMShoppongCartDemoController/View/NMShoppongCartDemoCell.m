//
//  NMShoppongCartDemoCell.m
//  ShoppingCartDemo
//
//  Created by nuomi on 16/8/29.
//  Copyright © 2016年 nuomi. All rights reserved.
//

#import "NMShoppongCartDemoCell.h"
#import "NMShoppongCartDemoModel.h"
#import "UIImageView+WebCache.h"
#import "JSToolManager.h"
@implementation NMShoppongCartDemoCell{
   __weak NMShoppongCartDemoModel * dataModel;
    
}

- (void)awakeFromNib {
    [super awakeFromNib];
    _numberTextField.delegate = self;
}

- (void)setInfo:(id)info{
    dataModel = info;
    _priceLabel.text = [NSString stringWithFormat:@"%@",dataModel.price];
    _numberTextField.text = dataModel.curentNum;
    _titleLabel.text = dataModel.title;
    [_iconImageView sd_setImageWithURL:[NSURL URLWithString:dataModel.imageUrl]];
    [self checkNum];
}

#pragma mark 点击选择btn
- (IBAction)tapSelectedBtn:(UIButton *)sender {
    sender.selected = !sender.selected;
    dataModel.isSelected = sender.selected;
}

#pragma mark 点击加号按钮
- (IBAction)tapAddBtn:(id)sender {
    [_numberTextField resignFirstResponder];
    NSInteger num = dataModel.curentNum.integerValue;
    ++ num;
    dataModel.curentNum = [NSString stringWithFormat:@"%ld",(long)num];
    _numberTextField.text = dataModel.curentNum;
    [self checkNum];
}

#pragma mark 点击减号按钮
- (IBAction)tapSubBtn:(id)sender {
    [_numberTextField resignFirstResponder];
    NSInteger num = dataModel.curentNum.integerValue;
    -- num;
    dataModel.curentNum = [NSString stringWithFormat:@"%ld",(long)num];
    _numberTextField.text = dataModel.curentNum;
    [self checkNum];
}
#pragma mark 检查加减号按钮是否可点
- (void)checkNum{
    if (dataModel.curentNum.integerValue <= 0 ) {
        self.subBtn.enabled = NO;
    }
    else {
        self.subBtn.enabled = YES;
    }
    if (dataModel.curentNum.integerValue >=99) {
          self.addBtn.enabled = NO;
    }
    else {
         self.addBtn.enabled = YES;
    }
}
#pragma mark - UITextFieldDelegate
- (void)textFieldDidEndEditing:(UITextField *)textField{
    if ([JSToolManager isPureInt:textField.text]) {
        if (textField.text.integerValue < 0 || textField.text.integerValue > 99) {
            textField.text = dataModel.curentNum;
        }
        else {
            dataModel.curentNum = textField.text;
        }
    }
    else {
     textField.text = dataModel.curentNum;
    }
    [self checkNum];
    
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];
    return YES;
}

@end
