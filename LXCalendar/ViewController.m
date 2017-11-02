//
//  ViewController.m
//  LXCalendar
//
//  Created by chenergou on 2017/11/2.
//  Copyright © 2017年 漫漫. All rights reserved.
//

#import "ViewController.h"
#import "NextController.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    LxButton *button =[LxButton LXButtonWithTitle:@"点击" titleFont:Font(14) Image:nil backgroundImage:nil backgroundColor:[UIColor redColor] titleColor:[UIColor hexStringToColor:@"000000"] frame:CGRectMake(20, 100, 100, 40)];
    [self.view addSubview:button];
    WeakSelf(weakSelf);
    [button addClickBlock:^(UIButton *button) {
        
        NextController *changeVc =[[NextController alloc]init];
        [weakSelf.navigationController pushViewController:changeVc animated:YES];
    }];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
