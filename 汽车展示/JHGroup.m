//
//  JHGroup.m
//  汽车展示
//
//  Created by piglikeyoung on 15/3/2.
//  Copyright (c) 2015年 jinheng. All rights reserved.
//

#import "JHGroup.h"
#import "JHCar.h"

@implementation JHGroup

-(instancetype) initWithDict:(NSDictionary *)dict
{
    if (self = [super init]) {
        
        // 赋值属性
        // [self setValuesForKeysWithDictionary:dict];
        self.title = dict[@"title"];
        NSArray *dictArray =  dict[@"cars"];
        // 将字典转换为模型
        NSMutableArray *models = [NSMutableArray arrayWithCapacity:dictArray.count];
        for (NSDictionary *dict in dictArray) {
            JHCar *car = [JHCar carWithDict:dict];
            [models addObject:car];
        }
        // 赋值存储模型的数组给属性
        self.cars = models;
    }
    return self;
}

+ (instancetype)groupWithDict:(NSDictionary *)dict
{
    return [[self alloc] initWithDict:dict];
}

@end