//
//  ZHQPerson.h
//  金竹的通讯录
//
//  Created by student on 2019/6/25.
//  Copyright © 2019年 student. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ZHQPerson : NSObject<NSCoding>
@property (strong,nonatomic) NSString * name;
@property (strong,nonatomic) NSString * tel;
@end

NS_ASSUME_NONNULL_END
