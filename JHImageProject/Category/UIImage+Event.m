//
//  UIImage+Event.m
//  JHImageProject
//
//  Created by admin on 2017/2/23.
//  Copyright © 2017年 admin. All rights reserved.
//

#import "UIImage+Event.h"
//：定义了一些简单处理32位像素的宏。为了得到红色通道的值，你需要得到前8位。为了得到其它的颜色通道值，你需要进行位移并取截取。
#define Mask8(x) ( (x) & 0xFF )
#define R(x) ( Mask8(x) )
#define G(x) ( Mask8(x >> 8 ) )
#define B(x) ( Mask8(x >> 16) )
@implementation UIImage (Event)
-(void)logPixelsOfImage{
    // 1、把UIImage对象转换为需要被核心图形库调用的CGImage对象。同时，得到图形的宽度和高度。
    CGImageRef inputCGImage = [self CGImage];
    NSUInteger width = CGImageGetWidth(inputCGImage);
    NSUInteger height = CGImageGetHeight(inputCGImage);
    
    // 2.由于你使用的是32位RGB颜色空间模式，你需要定义一些参数bytesPerPixel（每像素大小）和bitsPerComponent（每个颜色通道大小），然后计算图像bytesPerRow（每行有大）。最后，使用一个数组来存储像素的值。
    NSUInteger bytesPerPixel = 4;//一个像素4个字节
    NSUInteger bytesPerRow = bytesPerPixel * width;
    NSUInteger bitsPerComponent = 8;//8位二进制表示256个亮度值
    
    UInt32 * pixels;
    pixels = (UInt32 *) calloc(height * width,     sizeof(UInt32));//在内存的动态存储区中分配n个长度为size的连续空间，函数返回一个指向分配起始地址的指针；如果分配不成功，返回NULL。
    
    // 3.创建一个RGB模式的颜色空间CGColorSpace和一个容器CGBitmapContext,将像素指针参数传递到容器中缓存进行存储。
    CGColorSpaceRef colorSpace =     CGColorSpaceCreateDeviceRGB();
    CGContextRef context =     CGBitmapContextCreate(pixels, width, height, bitsPerComponent, bytesPerRow, colorSpace, kCGImageAlphaPremultipliedLast |     kCGBitmapByteOrder32Big);
    
    // 4.把缓存中的图形绘制到显示器上。像素的填充格式是由你在创建context的时候进行指定的。
    CGContextDrawImage(context, CGRectMake(0, 0, width, height), inputCGImage);
    
    // 5. 清除colorSpace和context.
    CGColorSpaceRelease(colorSpace);
    CGContextRelease(context);
 
    //FTT
    //
    //map
    NSLog(@"Brightness of image:");
    // 定义一个指向第一个像素的指针，并使用2个for循环来遍历像素。其实也可以使用一个for循环从0遍历到width*height，但是这样写更容易理解图形是二维的。
    UInt32 * currentPixel = pixels;
    for (NSUInteger j = 0; j < height; j++) {
        for (NSUInteger i = 0; i < width; i++) {
            // 得到当前像素的值赋值给currentPixel并把它的亮度值打印出来。
            UInt32 color = *currentPixel;
            printf("%3.0f ",     (R(color)+G(color)+B(color))/3.0);
            // 增加currentPixel的值，使它指向下一个像素。如果你对指针的运算比较生疏，记住这个：currentPixel是一个指向UInt32的变量，当你把它加1后，它就会向前移动4字节（32位），然后指向了下一个像素的值。
            currentPixel++;
        }
        printf("\n");
    }
}
- (UIImage *)imageWithFixedOrientation {
    if (self.imageOrientation == UIImageOrientationUp)
        return self;
    
    UIGraphicsBeginImageContextWithOptions(self.size, NO, self.scale);
    [self drawInRect:(CGRect){0, 0, self.size}];
    UIImage *normalizedImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return normalizedImage;
}
@end
