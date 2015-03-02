//
//  NJGlobal.h
//  汽车展示
//
//  Created by piglikeyoung on 15/3/2.
//  Copyright (c) 2015年 jinheng. All rights reserved.
//

#ifndef _____NJGlobal_h
#define _____NJGlobal_h

#define NJInitH(name) \
- (instancetype)initWithDict:(NSDictionary *)dict; \
+ (instancetype)name##WithDict:(NSDictionary *)dict;

#define NJInitM(name)\
- (instancetype)initWithDict:(NSDictionary *)dict \
{ \
if (self = [super init]) { \
[self setValuesForKeysWithDictionary:dict]; \
} \
return self; \
} \
+ (instancetype)name##WithDict:(NSDictionary *)dict \
{ \
return [[self alloc] initWithDict:dict]; \
}


#endif
