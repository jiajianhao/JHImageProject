//
//  CircleView.m
//  JHImageProject
//
//  Created by admin on 2017/3/1.
//  Copyright © 2017年 admin. All rights reserved.
//

#import "CircleView.h"
#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]/// rgb颜色转换（16进制->10进制）
//rgb 有三个通道，即R、G、B三个颜色通道，每个颜色通道有8位，所以rgb有24位；
//十六进制转二进制：1位十六进制为4位二进制
//rgbValue & 0xFF0000 ,即取出前8位数据，R通道的二进制值；再执行 >> 16，右移16位，变成0xR值；用float转成10进制，得到像素值；执行 /255.0，算出色彩值
// 为啥除以255呢？ 灰度（亮度）是指黑白图像中点的颜色深度，范围一般从0到255，白色为255 ，黑色为0，故黑白图片也称灰度图像，在医学、图像识别领域有很广泛的用途

//lineCapStyle：path端点样式，有3种样式
//kCGLineCapButt：无端点;　kCGLineCapRound：圆形端点;kCGLineCapSquare：方形端点

//lineJoinStyle：拐角样式
//kCGLineJoinMiter：尖角;kCGLineJoinRound：圆角;kCGLineJoinBevel：缺角


@implementation CircleView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
//画矩形
//-(void)drawRect:(CGRect)rect{
//    UIBezierPath *path =[UIBezierPath bezierPathWithRect:CGRectMake(0, 0, rect.size.width, rect.size.height)];
//    [UIColorFromRGB(0xFF5000) setStroke];
//    [path setLineWidth:10];
//    [path stroke];
//    
//}

//画椭圆
//-(void)drawRect:(CGRect)rect{
//    //创建路径
//    UIBezierPath * path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(10,10, rect.size.width-20, rect.size.height-20)];
//    //修改图形状态参数
//    [[UIColor colorWithRed:0.5 green:0.5 blue:0.9 alpha:1.0] setStroke];//笔颜色
//    [path setLineWidth:10];//线条宽度
//    //渲染
//    [path stroke];
//    
//}

//画圆角矩形
//-(void)drawRect:(CGRect)rect{
////    UIBezierPath *path =[UIBezierPath bezierPathWithRoundedRect:CGRectMake(0, 0, rect.size.width, rect.size.height) cornerRadius:10];
////    [UIColorFromRGB(0xFF5000) setStroke];
////    [path setLineWidth:5];
////    path.lineCapStyle = kCGLineCapSquare;//拐角处理
////    path.lineJoinStyle = kCGLineCapSquare;//终点处理
////
////     [path stroke];
//    
//    
//    UIBezierPath *path =[UIBezierPath bezierPathWithRoundedRect:CGRectMake(0, 0, rect.size.width, rect.size.height) byRoundingCorners: UIRectCornerTopLeft|UIRectCornerTopRight cornerRadii:CGSizeMake(rect.size.width/2, rect.size.width/6)];
//    [UIColorFromRGB(0xFF5000) setStroke];
//    [path setLineWidth:5];
//    path.lineCapStyle = kCGLineCapRound;//线条处理
//    path.lineJoinStyle = kCGLineJoinRound;//拐角处理
//    [path fill];
////    [path stroke];
//
//}

//画弧
 - (void)drawRect:(CGRect)rect {
    CGFloat radius = rect.size.width / 2;
    CGFloat lineWidth = 10.0;
    UIBezierPath * path = [UIBezierPath bezierPathWithArcCenter:CGPointMake(radius, radius) radius:radius - lineWidth / 2 startAngle:0.f endAngle:M_PI*2*0.2 clockwise:YES];
    [[UIColor colorWithRed:0.5 green:0.5 blue:0.9 alpha:1.0] setStroke];
    [path setLineWidth:lineWidth];
    [path stroke];
}


-(void)layoutSubviews{
    NSLog(@"layoutSubviews");
}
-(void)layoutIfNeeded{
    NSLog(@"layoutIfNeeded");
    
}

@end
