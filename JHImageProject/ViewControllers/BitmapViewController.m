//
//  BitmapViewController.m
//  JHImageProject
//
//  Created by admin on 2017/2/23.
//  Copyright © 2017年 admin. All rights reserved.
//

#import "BitmapViewController.h"
#import "CircleView.h"
#import "JHCircleProgressView.h"
@interface BitmapViewController ()
@property(nonatomic,strong)JHCircleProgressView *circleProgressView;

@end

@implementation BitmapViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    //////////////////////////////
    [self readBurryImageAndLogPixels];
    //////////////////////////////
//    self.circleProgressView = [[JHCircleProgressView alloc]initWithFrame:CGRectMake((mWidth-100)/2, 0, 100, 100)];
//    self.circleProgressView.backgroundColor=[UIColor whiteColor];
//    self.circleProgressView.progress = 0.0;
//    [self.view addSubview: self.circleProgressView];
    //////////////////////////////
    CircleView *circle =[[CircleView alloc]initWithFrame:CGRectMake((mWidth-100)/2, 0, 100, 100)];
    circle.backgroundColor=[UIColor whiteColor];
    [self.view addSubview:circle];
    //////////////////////////////

   

}



- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    self.circleProgressView.progress = 1;
}
-(void)readBurryImageAndLogPixels{
    ///读取图片像素，以一张小图片为例（相对模糊）
    UIImage *image = [UIImage imageNamed:@"ghost1.png"];
    UIImage * fixedImage = [image imageWithFixedOrientation];
    [fixedImage logPixelsOfImage];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
