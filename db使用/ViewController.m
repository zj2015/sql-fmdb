//
//  ViewController.m
//  db使用
//
//  Created by 张杰 on 15/10/29.
//  Copyright © 2015年 ZJ. All rights reserved.
//

#import "ViewController.h"
#import "FMDatabase.h"
#import "FMDatabaseQueue.h"

@interface ViewController ()
{
    FMDatabase *_db;
    NSFileManager *_mgr;


}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _mgr = [NSFileManager defaultManager];
    NSString *path = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
    NSString *sqlpath = [path stringByAppendingPathComponent:@"car.sqlite"];
    
    _db = [FMDatabase databaseWithPath:sqlpath];
    
    if ([_mgr fileExistsAtPath:sqlpath]) {
        
    }else{
        
        NSLog(@"表格路径不存在");
        
    }
    if ([_db open]) {
        
        
        
        BOOL is = [_db executeUpdate:@"create table if not exists allcars (name text, age integer)"];
        if (!is) {
            
            NSLog(@"...数据库创建失败.");
        }else{
            
            NSLog(@"---数据库创建");
        }
        
    }else{
        NSLog(@"....数据库创建失败");
        
        
    }


    
    UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(100,100, 100, 100)];
    [btn setTitle:@"开始" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(cha) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];

}

- (void)btnclicked
{
    
    
    
    
}

- (void)insert
{

   BOOL is = [_db executeUpdate:@"insert into allcars (name) values (?)",@"李四"];

    if (is) {
        NSLog(@"插入表格成功");
    }

}

- (void)delest
{
    BOOL is = [_db executeUpdate:@"delete from allcars where name = ?",@"李四22"];
}


- (void)gai
{

   BOOL is = [_db executeUpdate:@"update allcars set name = ? where name = ?",@"李四22",@"李四"];
}

- (void)cha
{

    FMResultSet *set = [_db executeQuery:@"select name from allcars"];
    while ([set next]) {
        
        NSString *name = [set stringForColumn:@"name"];
        
        NSLog(@"...%@",name);
    }
}

-(void)text
{
    
    [_db executeUpdate:@"create table if no existe cars (name text, age integer, pp text)"];
    [_db executeUpdate:@"insert into cars where name = ?",@"张三"];
    [_db executeUpdate:@"update cars set name = ? where name = ?",@"李四",@"张三"];
    [_db executeQuery:@"select * from cars"];
    [_db executeUpdate:@"delete from cars where name = ?",@"张三"];
}

- (void)text2
{

    [_db executeUpdate:@"create table if no existe carss (name text, data blob, age intege)"];
    [_db executeUpdate:@"insert into carss (name, age, data) value (?,?,?)",@"zhangcaa",@"10",@"data"];
    [_db executeUpdate:@"delete from carss where name = ?",@"zhangcaa"];
    [_db executeUpdate:@"update carss set name = ? where age = ?",@"liscac",@"10"];
    [_db executeQuery:@"select * form carss"];
    

}

- (void)text3
{
    [_db executeUpdate:@"create table if no existe carcc (aa text, pp text)"];
    [_db executeUpdate:@"delete frome carcc where "];
    [_db executeUpdate:@"update frome carcc where "];
    [_db executeUpdate:@"insert into carcc (aa, pp) values (?,?)"];
    [_db executeQuery:@"selete * frome carcc"];
    

}


- (void)text4
{
    @"create table if no cars (name text)";
    @"insert into cars (name) vaules (?)";
    @"update cars set name = ? where name = ?";
    @"delete form cars where name =?";
    @"select *form cars";
    
    FMDatabaseQueue *queue = [FMDatabaseQueue databaseQueueWithPath:nil];
    
    [queue inDeferredTransaction:^(FMDatabase *db, BOOL *rollback) {
        
        [db beginTransaction];
        @try {
         
        }
        @catch (NSException *exception) {
            
            
        }
        @finally {
            
        }
    
        [db close];
    
    }];
}



@end
