//
//  JHCar.h
//  汽车展示
//
//  Created by piglikeyoung on 15/3/2.
//  Copyright (c) 2015年 jinheng. All rights reserved.
//


#import <Foundation/Foundation.h>
#import "NJGlobal.h"

@interface JHCar : NSObject

/**
 *  品牌图标
 */
@property (nonatomic, copy) NSString *icon;
/**
 *  品牌名称
 */
@property (nonatomic, copy) NSString *name;

NJInitH(car)

@end
