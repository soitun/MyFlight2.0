//
//  ShowSelectedResultViewController.h
//  MyFlight2.0
//
//  Created by sss on 12-12-6.
//  Copyright (c) 2012年 LIAN YOU. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CustomTableViewCell.h"
#import "SearchAirPort.h"
#import "SelectResultCell.h"
@class SearchFlightData;
@interface ShowSelectedResultViewController : UIViewController<UITableViewDataSource,UITableViewDelegate,UIScrollViewDelegate>
{
    IBOutlet UIButton *salesText;
    
    IBOutlet UIButton *nowDateBtn;
    IBOutlet UIButton *theDayAfterBtn;
    IBOutlet UIButton *theDayBeforeBtn;
    IBOutlet UIButton *cancelSalesText;
    
    IBOutlet UIButton *sortBtn;
    IBOutlet UILabel *backImagelabel;
    IBOutlet UIButton *siftBtn;
}
@property (retain, nonatomic) IBOutlet UITableView *showResultTableView;
@property (retain, nonatomic) SearchAirPort * airPort;
@property (retain, nonatomic) NSArray * dateArr;  // 接收返回的数据
@property (retain, nonatomic) NSMutableArray * searchFlightDateArr;

@property (retain, nonatomic) IBOutlet SelectResultCell *showCell;

- (IBAction)enterSales:(id)sender;        // 进入促销活动
- (IBAction)enterTheDayBefore:(id)sender; // 进入前一天的查询结果
- (IBAction)showCalendar:(id)sender;      // 显示日历，选择日期
- (IBAction)enterTheDayAfter:(id)sender;  //进入下一天的查询结果
- (IBAction)siftByAirPort:(UIButton *)sender;     // 按照航空公司进行筛选查询结果
- (IBAction)sortByDate:(UIButton *)sender;        // 对查询结果按时间进行排序


@end
