//
//  Quartz2DView.m
//  JHImageProject
//
//  Created by admin on 2017/2/28.
//  Copyright © 2017年 admin. All rights reserved.
//

#import "Quartz2DView.h"

@implementation Quartz2DView


/*
 Only override drawRect: if you perform custom drawing.
 An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
     Drawing code
}
*/

-(void)drawRect:(CGRect)rect{
    //创建路径
    UIBezierPath * path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(100, 100, 200, 200)];
    //修改图形状态参数
    [[UIColor colorWithRed:0.5 green:0.5 blue:0.9 alpha:1.0] setStroke];//笔颜色
    [path setLineWidth:10];//线条宽度
    //渲染
    [path stroke];
 
}


@end
