//
//  ViewController.m
//  汽车展示
//
//  Created by piglikeyoung on 15/3/2.
//  Copyright (c) 2015年 jinheng. All rights reserved.
//

#import "ViewController.h"
#import "JHGroup.h"
#import "JHCar.h"

@interface ViewController ()<UITableViewDataSource>

/**
 *  保存所有的数据
 */
@property (nonatomic, strong) NSArray *carGroups;

@end

@implementation ViewController

#pragma mark - 懒加载
- (NSArray *)carGroups
{
    if (_carGroups == nil) {
        NSString *fullPath = [[NSBundle mainBundle] pathForResource:@"cars_total.plist" ofType:nil];
        NSArray *dictArray = [NSArray arrayWithContentsOfFile:fullPath];
        NSMutableArray *models = [NSMutableArray arrayWithCapacity:dictArray.count];
        for (NSDictionary *dict in dictArray) {
            JHGroup *g = [JHGroup groupWithDict:dict];
            [models addObject:g];
        }
        self.carGroups = [models copy];
    }
    return _carGroups;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

#pragma mark - UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.carGroups.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // 1.取出对应的组
    JHGroup *g = self.carGroups[section];
    // 2.返回对应组的行数
    return g.cars.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifier = @"car";
    
    // 1.取缓存池中找cell
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    // 2.如果没有cell就创建cell
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    
    // 3.设置数据
    // 3.1获取对应的组
    JHGroup *g = self.carGroups[indexPath.section];
    
    // 3.2获取对应的行
    JHCar *car = g.cars[indexPath.row];
    
    // 3.3赋值
    cell.imageView.image = [UIImage imageNamed:car.icon];
    cell.textLabel.text = car.name;
    
    
    // 4.返回cell
    return cell;
}

#pragma mark - 返回索引(数据源方法系统自动调用)
-(NSArray *)sectionIndexTitlesForTableView:(UITableView *)tableView
{
    NSArray *titles = [self.carGroups valueForKeyPath:@"title"];
    return titles;
}

-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    // 1.取出对应的组
    JHGroup *g = self.carGroups[section];
    
    // 2.返回对应组的标题
    return g.title;
}

-(BOOL)prefersStatusBarHidden
{
    return YES;
}

@end
