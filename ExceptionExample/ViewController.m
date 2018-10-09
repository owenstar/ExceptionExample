//
//  ViewController.m
//  ExceptionExample
//
//  Created by nihuo on 2018/10/9.
//  Copyright © 2018年 nihuo. All rights reserved.
//

#import "ViewController.h"
struct HHH{
    int a;
    int b;
};
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    // Do any additional setup after loading the view, typically from a nib.
}

- (IBAction)click:(id)sender {
    
    //exception
//    NSArray * aa = @[];
//    NSLog(@"%@",aa[5]);
    
    
    //signal  SIGABRT
//    测试需要注意：信号时不能在 debug 环境下进行，系统的 debug 会优先拦截信号。正确的测试姿势，安装应用后关闭 debug，直接在模拟器中点击应用制造信号。Exception 测试可以在 debug 环境下进行。
    struct HHH * A ={999, 99};
    free(A);
}

//使用上述方式收集到的堆栈信息只包含错误线程，其他线程的调用堆栈无法获取。而在一些 Signal 的出错信息仅靠崩溃线程的堆栈无法找到原因，需同时根据其他线程调用堆栈来寻找崩溃原因。
//
//目前成熟的开源崩溃日志收集服务有很多，如 KSCrash，PLCrashReporter，CrashKit 等，使用一番后觉得 PLCrashReporter 更符合项目要求。PL 收集崩溃日志信息和苹果官方日志兼容，扩展性较好，与已有服务衔接较为简单。

@end
