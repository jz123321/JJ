//
//  main.m
//  金竹的通讯录
//
//  Created by student on 2019/6/24.
//  Copyright © 2019年 student. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ZHQMenu.h"
int main(int argc, const char * argv[])
{
    //添加联系人
    //删除联系人
    //修改联系人
    //查找联系人
    //显示所有联系人
    //退出系统
    @autoreleasepool {
        ZHQMenu * menu=[[ZHQMenu alloc]init];//创建菜单对象
        while (1) {
            [menu show];//显示菜单
            if([menu input])//等待输入并处理
            {
                break;
            }
        }
        [menu show];//显示菜单
    }
    return 0;
}
