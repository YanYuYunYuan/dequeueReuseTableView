//
//  ViewController.m
//  dequeTableView
//
//  Created by 烟雨云渊 on 2017/9/9.
//  Copyright © 2017年 YW. All rights reserved.
//

#import "ViewController.h"
#import "headviewTitle.h"
#import "titleAndChildView.h"

#define viewWidth [UIScreen mainScreen].bounds.size.width

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) UITableView *tableView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.tableView];

}

- (UITableView*)tableView{
    if (!_tableView) {
        UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height) style:UITableViewStyleGrouped];
        [tableView registerClass:[headviewTitle class] forHeaderFooterViewReuseIdentifier:headviewTitleIdentifier];
        [tableView registerClass:[titleAndChildView class] forHeaderFooterViewReuseIdentifier:titleAndChildViewIdentifier];
        tableView.delegate = self;
        tableView.dataSource = self;
        [self.view addSubview:tableView];
        _tableView = tableView;
    }
    return _tableView;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 20;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 3;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellIdentifier = @"cellIdentifier";
    UITableViewCell *myCell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (myCell == nil) {
        myCell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellIdentifier];
        myCell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    myCell.textLabel.text = @"这是测试table";
    return myCell;
}

- (UIView*)tableView:(UITableView*)tableView viewForHeaderInSection:(NSInteger)section
{
    if (section != 1) {
        headviewTitle *titleView = [tableView dequeueReusableHeaderFooterViewWithIdentifier:headviewTitleIdentifier];
        if (section == 0) {
            titleView.theTitle =  @"选择设备";
        }else if (section==2){
            titleView.theTitle =  @"选择故障原因";
        }else if (section==3){
            titleView.theTitle =  @"更换配件";
        }else if (section == 4){
            titleView.theTitle =  @"维修类型";
        }else if (section == 5){
            titleView.theTitle =  @"维修级别";
        }else if (section==6){
            titleView.theTitle =  @"费用";
        }else if (section == 7){
            titleView.theTitle =  @"报障类型";
        }else if (section ==8){
            titleView.theTitle =  @"维修结果";
        }else if (section==9){
            titleView.theTitle =  @"运行参数";
        }else if (section==10){
            titleView.theTitle =  @"备注";
        }else if (section==11){
            titleView.theTitle =  @"拍照上传";
        }
        titleView.theTitle =  [NSString stringWithFormat:@"拍照上传%ld",section];
        return titleView; 
    }else{
        titleAndChildView * childView= [tableView dequeueReusableHeaderFooterViewWithIdentifier:titleAndChildViewIdentifier];
            childView.theTitle =  @"故障现象";
            childView.couse = @"点击了解更多常见故障";
        return childView;
    }
}

//- (UIView*)tableView:(UITableView*)tableView viewForHeaderInSection:(NSInteger)section
//{
//    static NSString* HeaderIdentifier = @"YWDoTroubleMissionTableViewControllerForHeaderInSection";
//    UITableViewHeaderFooterView* headerView = [tableView dequeueReusableHeaderFooterViewWithIdentifier:HeaderIdentifier];
//    if (headerView == nil) {
//        headerView = [[UITableViewHeaderFooterView alloc] initWithReuseIdentifier:HeaderIdentifier];
//        UILabel* label = [[UILabel alloc] init];
//        label.textAlignment = NSTextAlignmentLeft;
//        label.textColor = [UIColor grayColor];
//        label.tag = 2006;
//        [headerView addSubview:label];
//        
//        UILabel* tapMoreLabel = [[UILabel alloc] init];
//        tapMoreLabel.tag = 2017;
//        tapMoreLabel.textAlignment = NSTextAlignmentRight;
//        tapMoreLabel.textColor = [UIColor blueColor];
//        [headerView addSubview:tapMoreLabel];
//    }
//    NSString *headText = [self titleForHeaderInSection:section];
//    UILabel* label = [headerView viewWithTag:2006];
//    label.text = headText;
//    UILabel *tapMoreLb = [headerView viewWithTag:2017];
//    //赋值
//    if (section == 1) {
//        tapMoreLb.hidden = NO;
//        NSLog(@"section == %ld",section);
//        NSString *tapText = @"点击了解更多常见故障";
//        label.frame = CGRectMake(15, 0, 100, 35);
//        tapMoreLb.frame = CGRectMake(CGRectGetMaxX(label.frame)+20, 5, viewWidth-CGRectGetMaxX(label.frame)-35, 30);
//        tapMoreLb.text = tapText;
//        // 下划线
//        NSDictionary *attribtDic = @{NSUnderlineStyleAttributeName: [NSNumber numberWithInteger:NSUnderlineStyleSingle]};
//        NSMutableAttributedString *attribtStr = [[NSMutableAttributedString alloc]initWithString:tapText attributes:attribtDic];
//        tapMoreLb.attributedText = attribtStr;
//    }else{
//        tapMoreLb.hidden = YES;
//        NSLog(@"section == %ld",section);
//        label.frame = CGRectMake(15, 0, viewWidth-30, 35);
//    }
//    return headerView;
//}

//- (UIView*)tableView:(UITableView*)tableView viewForHeaderInSection:(NSInteger)section
//{
//    static NSString* HeaderIdentifier = @"YWDoTroubleMissionTableViewControllerForHeaderInSection";
//    UITableViewHeaderFooterView* headerView = [tableView dequeueReusableHeaderFooterViewWithIdentifier:HeaderIdentifier];
//    if (headerView == nil) {
//        headerView = [[UITableViewHeaderFooterView alloc] initWithReuseIdentifier:HeaderIdentifier];
//        
//    }else{
//        for (UIView *view in headerView.subviews) {
//            [view removeFromSuperview];
//        }
//    }
//    UILabel* label = [[UILabel alloc] init];
//    label.textAlignment = NSTextAlignmentLeft;
//    label.textColor = [UIColor grayColor];
//    [headerView addSubview:label];
//    NSString *headText = [self titleForHeaderInSection:section];
//    label.text = headText;
//    //    UILabel *tapMoreLb = [headerView viewWithTag:2017];
//    //赋值
//    if (section == 1) {
//        UILabel* tapMoreLabel = [[UILabel alloc] init];
//        //        tapMoreLabel.tag = 2017;
//        tapMoreLabel.textAlignment = NSTextAlignmentRight;
//        tapMoreLabel.textColor = [UIColor blueColor];
//        [headerView addSubview:tapMoreLabel];
//        
//        NSString *tapText = @"点击了解更多常见故障";
//        label.frame = CGRectMake(15, 0, 100, 35);
//        tapMoreLabel.frame = CGRectMake(CGRectGetMaxX(label.frame)+20, 5, viewWidth-CGRectGetMaxX(label.frame)-35, 30);
//        tapMoreLabel.text = tapText;
//        // 下划线
//        NSDictionary *attribtDic = @{NSUnderlineStyleAttributeName: [NSNumber numberWithInteger:NSUnderlineStyleSingle]};
//        NSMutableAttributedString *attribtStr = [[NSMutableAttributedString alloc]initWithString:tapText attributes:attribtDic];
//        tapMoreLabel.attributedText = attribtStr;
//    }else{
//        label.frame = CGRectMake(15, 0, viewWidth-30, 35);
//    }
//    return headerView;
//}

-(NSString *)titleForHeaderInSection:(NSInteger)section{
    if (section == 0) {
        return @"选择设备";
    }else if (section == 1){
        return @"故障现象";
    }else if (section==2){
        return @"选择故障原因";
    }else if (section==3){
        return @"更换配件";
    }else if (section == 4){
        return @"维修类型";
    }else if (section == 5){
        return @"维修级别";
    }else if (section==6){
        return @"费用";
    }else if (section == 7){
        return @"报障类型";
    }else if (section ==8){
        return @"维修结果";
    }else if (section==9){
        return @"运行参数";
    }else if (section==10){
        return @"备注";
    }else if (section==11){
        return @"拍照上传";
    }
    return [NSString stringWithFormat:@"拍照上传%ld",section];
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 35;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
