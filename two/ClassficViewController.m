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
#import "MJExtension.h"

@interface ClassficViewController ()<UITableViewDelegate,UITableViewDataSource>
{
    classficModel *classModel;
}
@property(nonatomic,strong)UITableView *tableView;
@property(nonatomic,strong)NSArray *array;
@property(nonatomic,strong)NSArray *listArray;

@end
static NSString *const cellID = @"cellID";
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
- (NSArray *)listArray{
    if (!_listArray) {
        NSString *plistPath = [[NSBundle mainBundle] pathForResource:@"iCategoryList.plist" ofType:nil];
        _listArray = [[NSArray alloc] initWithContentsOfFile:plistPath];
    }
    return _listArray;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    classModel = [classficModel new];
    [self initUI];
}
- (void)initUI{
    [self.view addSubview:self.tableView];
    [self updateViewConstraints];
    [_tableView registerClass:[classifyCell class] forCellReuseIdentifier:cellID];
}
- (void)updateViewConstraints{
    [super updateViewConstraints];
    WS(weakSelf);
    [_tableView mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.bottom.equalTo(weakSelf.view);
    }];
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.array.count;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 60;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    classifyCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID forIndexPath:indexPath];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    NSDictionary *dataDic = _array[indexPath.row];
    classModel = [classficModel mj_objectWithKeyValues:dataDic];
    cell.model = classModel;
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
//     NSDictionary *listDic = _listArray[indexPath.row-1];
//    listModel *listModel = [classficModel mj_objectWithKeyValues:listDic];
    [self pushList];
   
}
- (void)pushList{
    if (self.delegate && [self.delegate respondsToSelector:@selector(pushList)]) {
        [self.delegate pushList];
    }
}
@end
