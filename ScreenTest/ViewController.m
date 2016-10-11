//
//  ViewController.m
//  ScreenTest
//
//  Created by luyu on 16/10/11.
//  Copyright © 2016年 luyu. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (assign, nonatomic)CGFloat R;
@property (assign, nonatomic)CGFloat G;
@property (assign, nonatomic)CGFloat B;
@property (strong, nonatomic)UIView *topView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.view.backgroundColor = [UIColor whiteColor];
    [self initTest];
    
}

- (BOOL)prefersStatusBarHidden {
    return YES;
}

- (void)initTest {
    
    CGFloat SCWidth = [UIScreen mainScreen].bounds.size.width;
    CGFloat SCHeight = [UIScreen mainScreen].bounds.size.height;
    CGFloat width = SCWidth/64;
    
    
    for (int i = 0; i<64; i++) {
        UIView *view = [[UIView alloc] initWithFrame:CGRectMake(i*width, 0, width, SCHeight)];
        
        float idx = i;
        CGFloat R = (idx*4)/254;
        
        view.backgroundColor = [UIColor colorWithDisplayP3Red:0 green:0 blue:R alpha:1];
        
        [self.view addSubview:view];
        view  = nil;
    }
    
    _topView = [UIView new];
    _topView.frame = self.view.frame;
    _R = 1;
    _topView.backgroundColor = [UIColor colorWithDisplayP3Red:_R green:_G blue:_B alpha:1];
    [self.view addSubview:_topView];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self tapChangeColor];
}

- (void)tapChangeColor {
    NSArray *arr = @[@[@1,@0,@0],
                     @[@0, @1, @0],
                     @[@0, @0, @1],
                     @[@0, @0, @0],
                     @[@1, @1, @1],
                     ];
    
    static int idx = 1;
    
    _R = [arr[idx][0] floatValue];
    _G = [arr[idx][1] floatValue];
    _B = [arr[idx][2] floatValue];
    
    _topView.backgroundColor = [UIColor colorWithDisplayP3Red:_R green:_G blue:_B alpha:1];
    
    idx += 1;
    if (idx > 4) {
        idx = 0;
    }
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
