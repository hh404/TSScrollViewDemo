//
//  ViewController.m
//  TSScrollViewDemo
//
//  Created by huangjianwu on 2016/12/28.
//  Copyright © 2016年 huangjianwu. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UIScrollViewDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    UIScrollView *sv = [[UIScrollView alloc] initWithFrame:CGRectMake(20, 200, CGRectGetWidth([UIScreen mainScreen].bounds) - 40, CGRectGetWidth([UIScreen mainScreen].bounds) - 170)];
    sv.delegate = self;
    [self.view addSubview:sv];
    sv.backgroundColor = [UIColor yellowColor];
    self.view.backgroundColor = [UIColor magentaColor];
    
    UIImageView *imgv1 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"empty"]];
    [sv addSubview:imgv1];
    
    UIImageView *imgv2 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"fail"]];
    CGRect rect = imgv2.frame;
    rect.origin.y = CGRectGetHeight(imgv1.frame) + 20;
    imgv2.frame = rect;
    [sv addSubview:imgv2];
    
    UIImageView *imgv3 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"loading"]];
    CGRect rect2 = imgv2.frame;
    rect2.origin.y = CGRectGetMaxY(imgv2.frame) + 20;
    imgv3.frame = rect2;
    [sv addSubview:imgv3];
    

    sv.layer.masksToBounds = NO;
    sv.contentSize = CGSizeMake(CGRectGetWidth(sv.bounds), CGRectGetMaxY(imgv3.frame));
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UIScrollViewDelegate

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    NSLog(@"bounds:%@ %@",NSStringFromCGRect(scrollView.bounds),NSStringFromCGRect([[scrollView subviews] firstObject].frame));
}

@end
