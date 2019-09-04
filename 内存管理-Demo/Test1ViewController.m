//
//  Test1ViewController.m
//  内存管理-Demo
//
//  Created by 王泽龙 on 2019/5/22.
//  Copyright © 2019 王泽龙. All rights reserved.
//

#import "Test1ViewController.h"
#import "Person.h"

@interface Test1ViewController ()

@end

__weak NSString *string_weak_ = nil;
__weak Person *person_weak_ = nil;
@implementation Test1ViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"探寻block的本质";
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"nav_back"] style:UIBarButtonItemStylePlain target:self action:@selector(back)];


    // 场景 1
//    [self demo1];
    
//    // 场景 2
    [self demo2];
//
//    // 场景 3
//    [self demo3];
    

}

- (void)demo1 {
    NSString *string = [NSString stringWithFormat:@"leichunfeng"];
    string_weak_ = string;
//    NSLog(@"string: %@", string_weak_);
    
    Person *person = [[Person alloc] init];
    person.age = 10;
    person_weak_ = person;
//    NSLog(@"person: %@", person_weak_);
}

- (void)demo2 {
    @autoreleasepool {
        NSString *string = [NSString stringWithFormat:@"leichunfengasdasdasdasdadaasdasdasdasdasdasdleichunfengasdasdasdasdadaasdasdasdasdasdasdleichunfengasdasdasdasdadaasdasdasdasdasdasd"];
        string_weak_ = string;
        
        Person *person = [[Person alloc] init];
        person.age = 10;
        person_weak_ = person;
    }
    NSLog(@"string: %@ %lu", string_weak_, (unsigned long)string_weak_.length);
//    NSLog(@"person: %@", person_weak_);


}

- (void)demo3 {
    NSString *string = nil;
    Person *person = nil;
    @autoreleasepool {
        string = [NSString stringWithFormat:@"leichunfeng"];
        string_weak_ = string;
        
        person = [[Person alloc] init];
        person.age = 10;
        person_weak_ = person;
    }
//    NSLog(@"string: %@", string_weak_);
    NSLog(@"person: %@", person_weak_);


}

//
//- (void)viewWillAppear:(BOOL)animated {
//    [super viewWillAppear:animated];
//    NSLog(@"string: %@", string_weak_);
//}
//
//- (void)viewDidAppear:(BOOL)animated {
//    [super viewDidAppear:animated];
//    NSLog(@"string: %@", string_weak_);
//}


- (void)back {
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
