//
//  Test1ViewController.m
//  内存管理-Demo
//
//  Created by 王泽龙 on 2019/5/22.
//  Copyright © 2019 王泽龙. All rights reserved.
//

#import "Test2ViewController.h"

@interface Test2ViewController ()
@property (nonatomic, strong) NSString *name;

@end

@implementation Test2ViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Tagged Pointer";
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"nav_back"] style:UIBarButtonItemStylePlain target:self action:@selector(back)];

    [self demo];
    [self demo1];
}

- (void)demo {
    NSString *str1 = [NSString stringWithFormat:@"asdasdasdasdasdasds"];
    NSString *str2 = [NSString stringWithFormat:@"abc"];
    NSLog(@"%p,%p", str1, str2);
    NSLog(@"%@,%@", [str1 class], [str2 class]);
    
    // 内存管理-Demo[36775:344478] 0x60000367d950,0xc3a4bd22bd96d78e
    // 内存管理-Demo[36775:344478] __NSCFString,NSTaggedPointerString
    
    dispatch_queue_t queue = dispatch_get_global_queue(0, 0);
    for (int i = 0; i < 1000; i++) {
        dispatch_async(queue, ^{
            // 堆空间 release2次
            self.name = [NSString stringWithFormat:@"asdasdasdasdasdasds"];
        });
    }
}

- (void)demo1 {
    dispatch_queue_t queue = dispatch_get_global_queue(0, 0);
    for (int i = 0; i < 1000; i++) {
        dispatch_async(queue, ^{
            // 栈空间  直接赋值，不会产生对象
            self.name = [NSString stringWithFormat:@"abc"];
        });
    }
}


- (void)back {
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
