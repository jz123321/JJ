//
//  ZHQMenu.h
//  金竹的通讯录
//
//  Created by student on 2019/6/24.
//  Copyright © 2019年 student. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ZHQTelbook.h"
NS_ASSUME_NONNULL_BEGIN

@interface ZHQMenu : NSObject
@property (strong,nonatomic) NSArray * items;
@property (strong,nonatomic) ZHQTelbook * book;
//通讯录
-(void)show;
-(BOOL)input;
@end

NS_ASSUME_NONNULL_END
