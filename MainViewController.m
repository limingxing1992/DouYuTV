//
//  MainViewController.m
//  DouYuTV
//
//  Created by qianfeng on 15/12/5.
//  Copyright © 2015年 李明星. All rights reserved.
//

#import "MainViewController.h"
#import "LiveCollectionViewCell.h"

#import "NewShowTableViewCell.h"
#import "MainTableViewCell.h"
#import "SectionHeadView.h"
@interface MainViewController ()<UITableViewDataSource,UITableViewDelegate,SectionHeadDelegate>
{
    UITableView *_tableView;
    
    //头部滚动视图
    SDCycleScrollView *_headerView;
    
    NSMutableArray *_showData;
    
    NSMutableArray *_mainData;
    
    NSInteger _count;
    
    UIActivityIndicatorView *_acview;
    
    BOOL _isRefeshing;
}
@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initTableView];

    //请求头部视图
    [self loadTopData];
    [self loadShowData];
    [self loadMainData];

    [self addUpRefresh];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


#pragma mark -------------定制tableView

- (void)initTableView
{
    //分区表示图
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT) style:UITableViewStyleGrouped];
    _tableView.dataSource = self;
    _tableView.delegate = self;
    _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    [_tableView registerClass:[NewShowTableViewCell class] forCellReuseIdentifier:@"show"];
    
    [_tableView registerClass:[MainTableViewCell class] forCellReuseIdentifier:@"umain"];
    
    
    [self.view addSubview:_tableView];

    _showData = [[NSMutableArray alloc] init];
    _mainData = [[NSMutableArray alloc] init];

    //菊花
    _acview = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
    _acview.center = CGPointMake(SCREEN_WIDTH / 2, SCREEN_HEIGHT /2);
    _acview.color = [UIColor blackColor];
    [_tableView addSubview:_acview];
    [_acview startAnimating];
    

}


#pragma mark -------------tableView代理

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    //天坑，，不能设0，否则会有系统默认的高度。。草草草。。
    return 0.01;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (section != 0) {
        return 35;
    }
    
    return 0.01;

}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    if (indexPath.section == 0) {
        return 110;
    }
    return 280 *KWidth_Scale;


}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    
    if (_mainData.count) {
        NSLog(@"表示图分区%ld",_mainData.count);
        return _mainData.count + 1;
    }
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        NewShowTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"show"];
        [cell updateWith:_showData];
        cell.block = ^(NSString *Id, NSString *name){
        
            MoreViewController *mvc = [[MoreViewController alloc] init];
            mvc.Id = Id;
            mvc.title = name;
            [self.navigationController pushViewController:mvc animated:YES];
        };
        return cell;
    }else{
        MainTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"umain"];
        [cell updateWith:_mainData[indexPath.section - 1]];
        return cell;
    }
//    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"myCell"];
//    cell.backgroundColor = [UIColor redColor];
//    return cell;
//    return nil;


}

//选中
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    return ;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    if (section != 0) {
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"SectionHeadView" owner:self options:nil];
        SectionHeadView *view = [nib objectAtIndex:0];
        RoomModel *model = _mainData[section-1];
        view.titleLable.text = model.title;
        view.Id = model.cate_id;
        view.delegate = self;
        
        return view;
    }
    return nil;


}

#pragma mark -------------------头部滚动视图

- (void)headerViewWith:(ScorllModel *)model
{
    _headerView = [[SDCycleScrollView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 200)];
    
    NSMutableArray *titlesArry = [[NSMutableArray alloc] init];
    NSMutableArray *urlArry = [[NSMutableArray alloc] init];
    //传入数组
    for (ScorllItemModel *obj in model.data) {
        [titlesArry addObject:obj.title];
        [urlArry addObject:obj.pic_url];
    }
    
    _headerView.titlesGroup = titlesArry;
    _headerView.imageURLStringsGroup = urlArry;
    
    
    _tableView.tableHeaderView = _headerView;
}


#pragma mark ------------------请求头部视图数据

- (void)loadTopData
{
    
    __weak typeof(self)weakself = self;
    [[Networking defaultNetwork] scrollrequsetSuccess:^(NSDictionary *dict) {
        
        ScorllModel *model = [[ScorllModel alloc] initWithDictionary:dict error:nil];
        [weakself headerViewWith:model];
        
    } failure:^(NSDictionary *dict) {
        
    }];

}


#pragma mark -------------------请求新秀视图数据

- (void)loadShowData
{
    
    [[Networking defaultNetwork] showRequestSuccess:^(NSDictionary *dict) {
        ShowModel *model = [[ShowModel alloc] initWithDictionary:dict error:nil];
        
        
        [_showData addObjectsFromArray:model.data.result];
        
        [_tableView reloadSections:[NSIndexSet indexSetWithIndex:0] withRowAnimation:UITableViewRowAnimationAutomatic];
        
    } failure:nil];


}


#pragma mark --------------------请求主要内容数据

- (void)loadMainData
{
    [[Networking defaultNetwork] mainRequestSuccess:^(NSDictionary *dict) {
        
        MainModel *model = [[MainModel alloc] initWithDictionary:dict error:nil];
        
        
        [_mainData addObjectsFromArray:model.data];
        
        NSLog(@"%ld",_mainData.count);
        
        //消灭菊花
        dispatch_async(dispatch_get_main_queue(), ^{
            [_acview stopAnimating];
        });
        
        [_tableView reloadData];
        if (_isRefeshing) {
            _isRefeshing = NO;
            [_tableView.header endRefreshing];
        }
        
    } failure:^(NSDictionary *dict) {
        
    }];



}

#pragma mark-------------------更多代理

- (void)onMore:(NSString *)Id title:(NSString *)title
{
    MoreViewController *mvc = [[MoreViewController alloc] init];
    mvc.Id = Id;
    mvc.title = title;
    [self.navigationController pushViewController:mvc animated:YES];
}


#pragma mark -----------------添加下拉刷新

- (void)addUpRefresh
{
    
    
    __weak typeof(self) weakself = self;
    _tableView.header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        if (_isRefeshing) {
            return ;
        }
        _isRefeshing = YES;
        
        [weakself loadMainData];
        
    }];

}
@end
