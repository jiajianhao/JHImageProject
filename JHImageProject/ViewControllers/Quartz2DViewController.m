//
//  Quartz2DViewController.m
//  JHImageProject
//
//  Created by admin on 2017/2/28.
//  Copyright © 2017年 admin. All rights reserved.
//
#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]/// rgb颜色转换（16进制->10进制）
//rgb 有三个通道，即R、G、B三个颜色通道，每个颜色通道有8位，所以rgb有24位；
//十六进制转二进制：1位十六进制为4位二进制
//rgbValue & 0xFF0000 ,即取出前8位数据，R通道的二进制值；再执行 >> 16，右移16位，变成0xR值；用float转成10进制，得到像素值；执行 /255.0，算出色彩值
// 为啥除以255呢？ 灰度（亮度）是指黑白图像中点的颜色深度，范围一般从0到255，白色为255 ，黑色为0，故黑白图片也称灰度图像，在医学、图像识别领域有很广泛的用途
#import "Quartz2DViewController.h"
#import "Quartz2DView.h"
@interface Quartz2DViewController ()<CALayerDelegate>
@property(nonatomic,strong)CAShapeLayer *shapeLayer;

@end

@implementation Quartz2DViewController
//- (void)loadView
//{
//    self.view=[[Quartz2DView alloc]init];
//
//}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
   
    [self.view setBackgroundColor:[UIColor whiteColor]];
//    [self mineView];
    
//    Quartz2DView *qqqq = [[Quartz2DView alloc]initWithFrame:CGRectMake(0, 0, mWidth, mWidth)];
//    [self.view addSubview:qqqq];
    
    //////////////////////////////
    [self showShapeLayer];
    
}
-(void)showShapeLayer{
    //动画渲染直接提交GPU，不像view的drawRect使用CPU，极大地提升性能
    //创建出CAShapeLayer
    self.shapeLayer = [CAShapeLayer layer];
    self.shapeLayer.frame = CGRectMake(0, 150, 200, 200);//设置shapeLayer的尺寸和位置
    self.shapeLayer.position = self.view.center;
    self.shapeLayer.fillColor = [UIColor clearColor].CGColor;//填充颜色为ClearColor
    
    //设置线条的宽度和颜色
    self.shapeLayer.lineWidth = 1.0f;
    self.shapeLayer.strokeColor = [UIColor redColor].CGColor;
    
    //创建出圆形贝塞尔曲线
    UIBezierPath *circlePath = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(0, 0, 200, 200)];
    
    //让贝塞尔曲线与CAShapeLayer产生联系
    self.shapeLayer.path = circlePath.CGPath;
    
    //添加并显示
    [self.view.layer addSublayer:self.shapeLayer];

    
}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    UIGraphicsBeginImageContextWithOptions(self.view.bounds.size, NO,0.0);
    
//    //获取当前的上下文
//    CGContextRef ctx = UIGraphicsGetCurrentContext();
//    //把控制器的view的内容画到上下文当中.
//    [self.view.layer drawInContext:ctx];
//    // [self.drawVIew.layer renderInContext:ctx];//修改后
//    
//    //从上下文当中生成一张图片
//    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
//    
//    //关闭上下文
//    UIGraphicsEndImageContext();
//    ///Users/apple/Desktop/素材
//    //把图片写入到桌面
//    //把图片转成二进制流
//    //NSData *data = UIImageJPEGRepresentation(newImage, 1);
//    NSData *data = UIImagePNGRepresentation(newImage);
//    [data writeToFile:@"/Users/admin/Desktop/DProject/newImage.png" atomically:YES];
}
-(void)mineView{
    
    //1.创建自定义的layer
          CALayer *layer=[CALayer layer];
          //2.设置layer的属性
          layer.backgroundColor=[UIColor brownColor].CGColor;
          layer.bounds=CGRectMake(0, 0, 200, 150);
          layer.anchorPoint=CGPointZero;
          layer.position=CGPointMake(100, 100);
          layer.cornerRadius=20;
          layer.shadowColor=[UIColor blackColor].CGColor;
          layer.shadowOffset=CGSizeMake(10, 20);
          layer.shadowOpacity=0.6;
    
          //设置代理
          layer.delegate=self;
          [layer setNeedsDisplay];
          //3.添加layer
          [self.view.layer addSublayer:layer];
  }
-(void)drawLayer:(CALayer *)layer inContext:(CGContextRef)ctx {
          //1.绘制图形
          //画一个圆
          CGContextAddEllipseInRect(ctx, CGRectMake(50, 50, 100, 100));
          //设置属性（颜色）
          //    [[UIColor yellowColor]set];
          CGContextSetRGBFillColor(ctx, 0, 0, 1, 1);
    
          //2.渲染
         CGContextFillPath(ctx);
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
