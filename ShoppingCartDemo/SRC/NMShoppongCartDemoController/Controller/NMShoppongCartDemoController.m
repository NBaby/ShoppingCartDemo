//
//  NMShoppongCartDemoController.m
//  ShoppingCartDemo
//
//  Created by nuomi on 16/8/28.
//  Copyright © 2016年 nuomi. All rights reserved.
//

#import "NMShoppongCartDemoController.h"
#import "NMAutoHeightTableCell.h"
#import "NMShoppongCartDemoCell.h"
#import "NMShoppongCartDemoModel.h"
#import "YYModel.h"
@interface NMShoppongCartDemoController ()<UITableViewDelegate,UITableViewDataSource>{
    NSMutableArray <NMShoppongCartDemoModel *> * dataArray;
}

@end

@implementation NMShoppongCartDemoController

#pragma mark - lifeCircle
- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"购物车";
    [self loadData];
}

- (void)dealloc {
   
    for (int i= 0 ; i < dataArray.count; i ++) {
        [dataArray[i] removeObserver:self forKeyPath:@"curentNum"];
        [dataArray[i] removeObserver:self forKeyPath:@"isSelected"];
    }
}
#pragma mark - UITableViewDelegate

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NMShoppongCartDemoCell * cell = (NMShoppongCartDemoCell *)[tableView nm_customCellWithCellName:@"NMShoppongCartDemoCell"];
    [cell setInfo:dataArray[indexPath.row]];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 86.f;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [self.view endEditing:YES];
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath{
    return YES;
}

- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath{
    return UITableViewCellEditingStyleDelete;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
    //删除处理
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [dataArray removeObjectAtIndex:indexPath.row];
        [_mainTableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
        [self calculateTotalPrice];
    }
   
    
}

#pragma mark - custonDelegate

#pragma mark - PriVateMethod
#pragma mark KVO监听
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context{
    if ([keyPath isEqualToString:@"isSelected"] || [keyPath isEqualToString:@"curentNum"]) {
        NSLog(@"重新计算价钱");
        [self calculateTotalPrice];
    }
}


#pragma 计算总金额
- (void)calculateTotalPrice{
    double totalPrice = 0;
    for (int i = 0; i < dataArray.count; i++) {
        if (dataArray[i].isSelected) {
            totalPrice += dataArray[i].curentNum.integerValue * dataArray[i].price.doubleValue;
        }
    }
    _totalPriceLabel.text = [NSString stringWithFormat:@"%.2f",totalPrice];
}

#pragma mark - EventResponse
- (void)loadData{
    dataArray = [[NSMutableArray alloc]init];
    //这里就自己造数据，就不从服务器加载了
    NMShoppongCartDemoModel * model = [[NMShoppongCartDemoModel alloc]init];
    model.imageUrl = @"http://img03.miyabaobei.com/item/10/1000/1000757_topic_1.jpg";
    model.price = @"10.10";
    model.curentNum = @"1";
    model.title = @"益智积木 彩虹积木 50块 适用年龄0到3岁 21cm*12cm*15.5cm";
    model.vc = self;
    [dataArray addObject:model];
    
    model = [[NMShoppongCartDemoModel alloc]init];
    model.imageUrl = @"http://img03.miyabaobei.com/item/10/1005/1005006_topic_1.jpg";
    model.price = @"100";
    model.curentNum = @"1";
    model.title = @"经典双语启蒙动物多米诺BHW061（150片）";
    model.vc = self;
    [dataArray addObject:model];
    
    model = [[NMShoppongCartDemoModel alloc]init];
    model.imageUrl = @"http://img03.miyabaobei.com/item/10/1005/1005088_topic_1.jpg";
    model.price = @"389.00";
    model.curentNum = @"1";
    model.title = @"盘装积木";
    model.vc = self;
    [dataArray addObject:model];
    
    model = [[NMShoppongCartDemoModel alloc]init];
    model.imageUrl = @"http://img03.miyabaobei.com/item/10/1003/1003440_topic_1.jpg";
    model.price = @"580.00";
    model.curentNum = @"1";
    model.title = @"双层三折小黑伞 小雏菊";
    model.vc = self;
    [dataArray addObject:model];
    
    model = [[NMShoppongCartDemoModel alloc]init];
    model.imageUrl = @"http://img03.miyabaobei.com/item/10/1010/1010073_topic_1.jpg";
    model.price = @"169.00";
    model.curentNum = @"1";
    model.title = @"有机棉布长袖贴身衣 男款";
    model.vc = self;
    [dataArray addObject:model];
    
    [self.mainTableView reloadData];
    [self calculateTotalPrice];
    
}
#pragma mark - Network

#pragma mark - getter & setter

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}



@end
