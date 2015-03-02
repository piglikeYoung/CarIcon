//
//  JHCroup.h
//  汽车展示
//
//  Created by piglikeyoung on 15/3/2.
//  Copyright (c) 2015年 jinheng. All rights reserved.
//



#import <Foundation/Foundation.h>
#import "NJGlobal.h"


@interface JHGroup : NSObject

/**
 *  分组标题
 */
@property (nonatomic, copy) NSString *title;
/**
 *  每一组中的汽车数据(存储的是汽车的模型)
 */
@property (nonatomic, strong) NSArray *cars;


NJInitH(group)

@end
