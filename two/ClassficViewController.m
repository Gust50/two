//
//  ClassficViewController.m
//  
//
//  Created by kobe on 16/11/30.
//
//

#import "ClassficViewController.h"
#import "classifyCell.h"
#import "classficModel.h"
#import "ListViewController.h"
#import "oneCell.h"
#import "FirstDetailViewController.h"
@interface ClassficViewController ()<UITableViewDelegate,UITableViewDataSource>
{
    classficModel *classModel;
    listModel *_listModel;
}
@property(nonatomic,strong)UITableView *tableView;
@property(nonatomic,strong)NSArray *array;
@property(nonatomic,strong)NSMutableArray *listArray;
@property(nonatomic,strong)ListViewController *listVC;
@property(nonatomic,strong)NSMutableArray *plistArray;
@property(nonatomic,strong)FirstDetailViewController *firstDetailVC;
@end
static NSString *const cellID = @"cellID";
static NSString *const oneID = @"oneID";
@implementation ClassficViewController
- (UITableView *)tableView{
    if (!_tableView) {
        _tableView = [UITableView new];
        _tableView.dataSource = self;
        _tableView.delegate = self;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    }
    return _tableView;
}
- (NSArray *)array{
    if (!_array) {
        NSString *plistPath = [[NSBundle mainBundle] pathForResource:@"classCategory.plist" ofType:nil];
        _array = [[NSArray alloc] initWithContentsOfFile:plistPath];
    }
    return _array;
}
- (NSMutableArray *)listArray{
    if (!_listArray) {
        _listArray = [NSMutableArray array];
    }
    return _listArray;
}
//- (ListViewController *)listVC{
//    if (!_listVC) {
//        _listVC = [ListViewController new];
//    }
//    return _listVC;
//}
- (NSMutableArray *)plistArray{
    if (!_plistArray) {
    NSString *plistPath = [[NSBundle mainBundle] pathForResource:@"iCategoryList.plist" ofType:nil];
                _plistArray = [[NSMutableArray alloc] initWithContentsOfFile:plistPath];
    }
    return _plistArray;
}
- (FirstDetailViewController *)firstDetailVC{
    if (!_firstDetailVC) {
        _firstDetailVC = [FirstDetailViewController new];
    }
    return _firstDetailVC;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    _index = 0;
    self.view.backgroundColor = [UIColor whiteColor];
    classModel = [classficModel new];
    _listModel = [listModel new];
    [self initUI];
}
- (void)initUI{
    [self loadNewData];
    [self.view addSubview:self.tableView];
    
    [self updateViewConstraints];
    [_tableView registerClass:[classifyCell class] forCellReuseIdentifier:cellID];
    [_tableView registerClass:[oneCell class] forCellReuseIdentifier:oneID];
    [self.tableView reloadData];
}
- (void)updateViewConstraints{
    [super updateViewConstraints];
    WS(weakSelf);
    [_tableView mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.bottom.equalTo(weakSelf.view);
    }];
   
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (_index == 0) {
        return self.listArray.count;
    }else{
        return self.array.count;
    }
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (_index == 0) {
        return 80;
    }else{
    return 60;
    }
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (_index == 0) {
        oneCell *cell = [tableView dequeueReusableCellWithIdentifier:oneID forIndexPath:indexPath];
        NSDictionary *dataDic = _listArray[indexPath.row];
        _listModel = [listModel mj_objectWithKeyValues:dataDic];
        cell.model = _listModel;
        return cell;
    }
    else{
        
    classifyCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID forIndexPath:indexPath];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    NSDictionary *dataDic = _array[indexPath.row];
    classModel = [classficModel mj_objectWithKeyValues:dataDic];
    cell.model = classModel;
        return cell;
    }
    
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (_index == 0) {
        [self pushList:self.firstDetailVC];
    }
    else{
        ListViewController *listVC = [ListViewController new];
        if (indexPath.row == 0)
         {
        listVC.cateType = @"zhibo";
         }
      else
         {
        NSDictionary *dic = self.plistArray[indexPath.row -1];
        listVC.cateType = @"feizhibo";
        listVC.cateNameArray = [dic objectForKey:@"categoryName"];
        listVC.cateIDArray = [dic objectForKey:@"categoryID"];
        
         }
        
        [self pushList:listVC];

    }
}
- (void)pushList:(UIViewController *)controller{
    if (self.delegate && [self.delegate respondsToSelector:@selector(pushList:)]) {
        [self.delegate pushList:controller];
    }
}
-(void)setIndex:(NSInteger)index{
    
    _index = index;
    [_tableView reloadData];
}
-(void)loadNewData{
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        [self getRecommendData];
    });
}
- (void)getRecommendData{
    [[NetworkSingleton sharedManager] getRecommendCourseResult:nil url:RecommentedUrl successBlock:^(id responseBody) {
        _listArray = [responseBody objectForKey:@"CourseList"];
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.tableView reloadData];
        });
    } failureBlock:^(NSString *error) {
        [SVProgressHUD showErrorWithStatus:error];
    }];
   
}
@end
