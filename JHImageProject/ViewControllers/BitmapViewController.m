//
//  BitmapViewController.m
//  JHImageProject
//
//  Created by admin on 2017/2/23.
//  Copyright © 2017年 admin. All rights reserved.
//

#import "BitmapViewController.h"

@interface BitmapViewController ()

@end

@implementation BitmapViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    //////////////////////////////
    [self readBurryImageAndLogPixels];
    //////////////////////////////

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
