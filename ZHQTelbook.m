//
//  ZHQTelbook.m
//  金竹的通讯录
//
//  Created by student on 2019/6/24.
//  Copyright © 2019年 student. All rights reserved.
//

#import "ZHQTelbook.h"
#import "ZHQPerson.h"
@implementation ZHQTelbook
-(instancetype)init
{
    self = [super init];
    if (self) {
        //从文件中读取联系人
        self.persons=[NSKeyedUnarchiver unarchiveObjectWithFile:@"persons.data"];
        if(self.persons==nil)//如果读取失败（没有这个文件）
        {
            //创建集合对象
            self.persons=[NSMutableArray arrayWithCapacity:100];
        }
    }
    return self;
}
-(BOOL)add
{
    //得到联系人的姓名和电话
    char ch[20];
    ZHQPerson * person=[[ZHQPerson alloc]init];
    printf("请输入联系人的姓名:");
    scanf("%s",ch);
    ch[19]='\0';
    person.name=[NSString stringWithUTF8String:ch];
    printf("请输入联系人的电话:");
    scanf("%s",ch);
    ch[19]='\0';
    person.tel=[NSString stringWithUTF8String:ch];
    //对输入的数据进行检验
    
    //加到通讯录
    [self.persons addObject:person];
    //持久化
    [NSKeyedArchiver archiveRootObject:self.persons toFile:@"persons.date"];
    return YES;
}
-(BOOL)delete
{
    //先得到你想删除的联系人
    char ch[4];
    printf("请输入你想删除联系人的编号:");
    scanf("%s",ch);
    ch[3]='\0';
    int n=atoi(ch);
    //输入数据的检验
    if(n>self.persons.count)
    {
        //printf("无法删除的编号！\n");
        return NO;
    }
    //删除内存中的联系人
    [self.persons removeObjectAtIndex:n-1];
    //同步到磁盘
    [NSKeyedArchiver archiveRootObject:self.persons toFile:@"persons.data"];
    return YES;
}
-(BOOL)update
{
    //先得到我们想修改的联系人
    char ch[4];
    printf("请输入你想修改联系人的编号:");
    scanf("%s",ch);
    ch[3]='\0';
    int n=atoi(ch);
    if(n<=0 || n>self.persons.count)
    {
        printf("无法修改的编号！\n");
        return NO;
    }
    char chh[20];
    
    printf("请先输入这个人的姓名:");
    scanf("%s",chh);
    chh[19]='\0';
    ZHQPerson * person=[[ZHQPerson alloc]init];
    person.name=[NSString stringWithUTF8String:chh];
    printf("请先输入这个人的电话:");
    scanf("%s",chh);
    chh[19]='\0';
    person.tel=[NSString stringWithUTF8String:chh];
    //数据有效性检验
    
    //修改内存的联系人
    self.persons[n-1]=person;
    //同步到磁盘
    [NSKeyedArchiver archiveRootObject:self.persons toFile:@"persons.data"];
    return YES;
}
-(BOOL)find
{
    //先得到你想查找的内容
    char ch[20];
    printf("请输入你想查找的姓名或电话:");
    scanf("%s",ch);
    ch[19]='\0';
    NSString * str=[NSString stringWithUTF8String:ch];
    //到内存中去查找
    BOOL bz=NO;
    for(ZHQPerson * p in self.persons)
    {
        if ([p.name isEqualToString:str] || [p.tel isEqualToString:str])
        {
            printf("%s\t%s\n",[p.name UTF8String],[p.tel UTF8String]);
            bz=YES;
        }
    }
    return bz;
}
-(void)show
{
    if(self.persons.count==0)
    {
        printf("对不起，目前还没有联系人！\n");
    }
    else
    {
        int c=0;
        printf("编号\t姓名\t电话\n");
        for (ZHQPerson * p in self.persons)
        {
            
            printf("%d\t%s\t%s\n",++c,[p.name UTF8String],[p.tel UTF8String]);
        }
    }
}
@end
