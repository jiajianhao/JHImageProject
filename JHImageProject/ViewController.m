//
//  ViewController.m
//  JHImageProject
//
//  Created by admin on 2017/2/23.
//  Copyright © 2017年 admin. All rights reserved.
//

#import "ViewController.h"
#import "UIImage+Event.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
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


@end
